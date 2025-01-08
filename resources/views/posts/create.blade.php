@extends('layouts.app')
@section('content')
<h1>Create Post</h1>
<form method="POST" action="{{ route('posts.store') }}">
    @csrf
    <div class="mb-3">
        <label class="form-label">Title:</label>
        <input type="text" name="title" class="form-control">
    </div>

    <div class="mb-3">
        <label class="form-label">Slug:</label>
        <input type="text" name="slug" class="form-control">
    </div>

    <div class="mb-3">
        <label class="form-label">Content:</label>
        <textarea name="content" class="form-control"></textarea>
    </div>

    <button type="submit" class="btn btn-success">Submit</button>
</form>
@endsection
