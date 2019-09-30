#Collect the length of the wall
do{
    try{
        [int]$lengthInput = Read-Host 'Length of the wall in meters? (1 to 100)'
        $numOK = $true
    }catch{
        $numOK = $false
    }
}until(($lengthInput -ge 1 -and $lengthInput -le 100) -and $numOK)

#Collect the height of the wall
do{
    try{
        [int]$heightInput = Read-Host 'Height of the wall in meters? (1 to 100)'
        $numOK = $true
    }catch{
        $numOK = $false
    }
}until(($heightInput -ge 1 -and $lengthInput -le 100) -and $numOK)

#Calculating the wall space in meter squared
[int]$wallSpace = $lengthInput * $heightInput

#Collect the coverage of the paint in meters
do{
    try{
        [int]$spreadInput = Read-Host 'In meters, what coverage can a single tin of your paint do? (1 to 100)'
        $numOK = $true
    }catch{
        $null = $false
    }
}until(($spreadInput -ge 1 -and $spreadInput -le 100) -and $numOK)

#Calculate how many tins of paint we need
[int]$tinsRequired = [math]::Ceiling($wallSpace / $spreadInput)

#Collect the price of the tin of paint
do{
    try{
        [decimal]$priceInput = Read-Host 'How much does a tin of paint cost? (Decimal 0.01 to 100.00)'
        $numOK = $true
    }catch{
        $numOK = $false
    }
}until(($priceInput -ge 0.01 -and $spreadInput -le 100.00) -and $numOK)

#Collect the tax rate
do{
    try{
        [int]$taxInput = Read-Host 'How much is the tax as a percentage? (1 to 100, usually 20)'
        $numOK = $true
    }catch{
        $numOK = $false
    }
}until(($taxInput -ge 1 -and  $taxInput -le 100) -and $numOK)

#Calculate the price, tax, total price and the amount of tins requried
$priceGross = [math]::Round($tinsRequired * $priceInput, 2)
$priceNet = [math]::Round($priceGross + $priceGross * ($taxInput / 100), 2)

#Clear the terminal
Clear-Host

#Display the result/"reciept" and format all the values
Write-Host @"
You will need $tinsRequired tin(s) of paint.

Cost  : $($priceGross.ToString('C'))
Tax   : $(($taxInput / 100).ToString('P0'))
Total : $($priceNet.ToString('C'))

Measurements/Details given:

Length of wall : $lengthInput meters
Height of wall : $heightInput meters
Coverage       : $spreadInput meters per tin
Paint cost     : $($priceInput.ToString('C')) per tin
"@ -ForegroundColor Green