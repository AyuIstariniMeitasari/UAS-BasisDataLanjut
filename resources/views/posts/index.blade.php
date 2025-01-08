@extends('layouts.app')
@section('content')
<h1>Posts</h1>
<a href="{{ route('posts.create') }}">Add New Post</a>
<table class="table table-striped">
    <tr>
        <th>Title</th>
        <th>Content</th>
        <th>Actions</th>
    </tr>
    @foreach($posts as $post)
    <tr>
        <td>{{ $post->title }}</td>
        <td>{{ $post->content }}</td>
        <td>
            <a href="{{ route('posts.edit', $post->id) }}" class="btn btn-primary">Edit</a>
            <form method="POST" action="{{ route('posts.destroy', $post->id) }}" style="display:inline;">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </td>
    </tr>
    @endforeach
</table>
@endsection
