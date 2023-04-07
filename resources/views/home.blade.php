@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header"> @if(Auth::user()->role_id == 2) User @else Admin @endif {{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>

            </div>
        </div>

        @if(Auth::user()->role_id == 1)
        <div class="col-md-12 mt-5">
            @if ($message = Session::get('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>{{ $message }}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            @endif
            <div class="card">
                <div class="card-header">{{ __('User') }}</div>
                <div class="card-body">
                    <table class="table table-stripe">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Company Name</th>
                                <th>Mobile Number</th>
                                <th>Email</th>
                                <th>action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if (count($user_list) > 0)
                            @foreach($user_list as $user)
                            <tr>
                                <td>{{ $user->full_name }}</td>
                                <td>{{ $user->company_name }}</td>
                                <td>{{ $user->mobile_number }}</td>
                                <td>{{ $user->email }}</td>
                                <td>
                                    <a href="{{ route('UserEdit',array('id'=>$user->id)) }}">
                                        <button class="btn btn-success">Edit</button>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td colspan="5" class="text-center">No record found</td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        @endif
    </div>
</div>
</div>
@endsection