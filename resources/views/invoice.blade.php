<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Invoice</title>
</head>

<body>

    <h1>Invoice</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Order Nb</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $item)
            <tr>
                <td>{{ $item->id }}</td>
                <td>{{ $item->order_number }}</td>
                <!-- Display other data fields -->
            </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>