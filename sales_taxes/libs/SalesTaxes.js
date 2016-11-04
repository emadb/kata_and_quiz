const SalesTaxes = function() { }
const basicSaleTax = 0.10

const taxMap = {
  'music CD': basicSaleTax,
  'bottle of perfume': basicSaleTax
} 

function round(num){
  return Math.ceil(num * 100) / 100
  //return (Math.ceil(num*20)/20).toFixed(2)
  //return (Math.ceil(num*20 - 0.05)/20).toFixed(2)
}

function calculateBasicTax(item){
  const tax = taxMap[item.type] || 0
  return item.price * tax
} 

function calculateImportTax(item){
  const importedTax = item.imported? 0.05 : 0
  return (item.price * importedTax)
}

SalesTaxes.prototype.foo = function(){
  return true 
}

SalesTaxes.prototype.receipt = function(items){

  const result = items.reduce((acc, curr) => {
    const totalTax = calculateBasicTax(curr) + calculateImportTax(curr)
    acc.total = acc.total + curr.price + totalTax
    acc.salesTaxes = acc.salesTaxes + totalTax
    return acc
  }, {
    total: 0, 
    salesTaxes: 0
  })

  return {total: round(result.total), salesTaxes: round(result.salesTaxes)}

}


module.exports = SalesTaxes

