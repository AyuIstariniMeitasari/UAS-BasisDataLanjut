@extends('layouts.app')
@section('content')
<h1>Edit Post</h1>
<form method="POST" action="{{ route('posts.update', $post->id) }}">
    @csrf
    @method('PUT')
    <div class="mb-3">
        <label class="form-label">Title:</label>
        <input type="text" name="title" class="form-control" value="{{ $post->title }}">
    </div>

    <div class="mb-3">
        <label class="form-label">Slug:</label>
        <input type="text" name="slug" class="form-control" value="{{ $post->slug }}">
    </div>

    <div class="mb-3">
        <label class="form-label">Content:</label>
        <textarea name="content" class="form-control">{{ $post->content }}</textarea>
    </div>

    <button type="submit" class="btn btn-success">Update</button>
</form>
@endsection