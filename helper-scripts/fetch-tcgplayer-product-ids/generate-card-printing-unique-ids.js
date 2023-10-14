import * as fs from 'fs'
import * as csv from 'csv'

// Set an index to null to omit generation for the associated unique ID
export const populateProductIds = (productDetails, language, cardIdIndex, rarityIndex, productIdIndex) => {
    return new Promise((resolve, reject) => {
        const inputCSV = `../../csvs/${language}/card-printing.csv`
        const outputCSV = `./temp-${language}-card-printing.csv`

        const readStream = fs.createReadStream(inputCSV)
        const writeStream = fs.createWriteStream(outputCSV)
        const csvStream = csv.parse({ delimiter: "\t" })
        const stringifier = csv.stringify({ delimiter: "\t" });

        const capitalizedLanguage = helper.capitalizeFirstLetter(language)

        const csvStreamFinished = function (cardPrintingIdsAdded) {
            fs.renameSync(outputCSV, inputCSV)
            console.log(`Product ID population completed for ${capitalizedLanguage} card printings with ${cardPrintingIdsAdded} new card printing IDs!`)
        }

        var headerRead = false
        var cardPrintingIdsAdded = 0

        csvStream.on("data", function(data) {
            // Skip header
            if (!headerRead) {
                headerRead = true
                stringifier.write(data)
                return
            }

            // Card Printing Unique ID
            if (
                cardIdIndex !== null && cardIdIndex !== undefined &&
                rarityIndex !== null && rarityIndex !== undefined &&
                productIdIndex !== null && productIdIndex !== undefined
            ) {
                // current card unique ID data
                var cardId = data[cardIdIndex]
                var rarity = data[rarityIndex]
                var productId = data[productIdIndex]

                var productIdExists = productId.trim() !== ''

                // generate unique ID for card
                if (!productIdExists) {
                    const matchingProductDetail = findMatchingProductDetail(productDetails, cardId, rarity)
                    data[productIdIndex] = matchingProductDetail.productId
                    cardPrintingIdsAdded += 1
                }
            }

            // save CSV row
            stringifier.write(data)
        })
        .on('end', () => {
            csvStreamFinished(cardPrintingIdsAdded)
            resolve()
        })
        .on("error", function (error) {
            console.log(error.message)
            reject()
        })

        stringifier.pipe(writeStream)
        readStream.pipe(csvStream)
    })
}

const findMatchingProductDetail = (productDetails, cardId, rarity) => {
    const matchingDetails = productDetails.filter(productDetail => productDetail.cardId == cardId && productDetail.rarity == rarity)

    if (matchingDetails.length != 1) {
        console.log(`Could not properly match product ID for ${cardId} - found ${matchingDetails.length} matches!`)
        return null
    }

    return matchingDetails[0]
}