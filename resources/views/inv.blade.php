<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">

    <title>Invoice</title>
    
</head>

<body>

    <h1>Invoice</h1>

    <table>
        <thead>
            <tr>
                <th>Order Nb</th>
                <br/>
                <th>Date</th>
                <br/>
                <th>Total</th>

                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $item)
            <tr>
                <td>{{ $item['order_number'] }}</td>
                <br/>
                <td>{{  date('Y-m-d', strtotime( $item['created_at'] ))  }}</td>
                <br/>
                <td>{{ $item['total'] }}</td>

                <!-- Display other data fields -->
            </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>