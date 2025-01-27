@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                  <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a>
                  </li>
                  <li class="breadcrumb-item" aria-current="page">
                    <a href="{{route('backend.document.index')}}" class="link">All Document</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Comment
                  </li>
                </ol>
              </nav>
                    <h1 class="mb-0 fw-bold">Comment Document</h1>
                </div> 
            </div>
        </div>
        <div class="container mt-5">    
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 mx-auto">
                    <div class="card">
                          <div class="card-header">
                            <h4><a href="{{route('backend.document.view', [Crypt::encrypt($document->doc_file)])}}">{{$document->document_title ?? 'No Title'}}</a></h4>
                        </div>  
                        <div class="card-body">
                            <h5 class="card-title mb-3">Add a Comment</h5>
                            <form id="addCommentForm" method="POST" action="{{route('backend.document.comment_store')}}">
                            @csrf    
                            <input type="hidden" name="document_id" value="{{$document->id}}">
                                <div class="mb-3">
                                    <label for="commentText" class="form-label">Comment</label>
                                    <textarea class="form-control" id="commentText" name="comment" rows="3" placeholder="Your comment" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
    
            <div class="row mt-4">
                <div class="col-lg-8 col-md-6 col-12 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">All Comments</h5>
                            <ul class="list-group" id="commentsList">
                                @foreach($comments as $comment)
                                <li class="list-group-item">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <strong>{{$comment->getUser->name}}</strong>
                                            <small class="text-muted">{{$comment->getUser->email}}</small>
                                            @if($comment->user_id == Auth::user()->id)
                                            <form action="{{route('admin.task.update_comment', [Crypt::encrypt($comment->id)])}}" method="POST">
                                                @csrf
                                                <textarea class="comment" name="comment" cols="70" disabled id="comment_{{$comment->id}}">{{$comment->comment}}</textarea>
                                                <div class=""> 
                                                    <input type="submit" class="update_btn" value="Update" id="update_btn_{{$comment->id}}" style="display:none;">
                                                </div>
                                            </form>
                                            @else
                                            <p>{{$comment->comment}}</p>
                                            @endif
                                            <small class="text-muted">{{Carbon\Carbon::parse($comment->created_at)->format('d M, Y h:i A')}}</small>
                                        </div>

                                        @if($comment->user_id == Auth::user()->id)
                                        <div>
                                             <button class="btn btn-primary btn-sm ms-2 edit_btn" data-id="{{$comment->id}}">Edit</button>
                                        </div>
                                        @endif
 
                                    </div>
                                     
                                    <!-- <div class="mt-3 reply-form" style="display: none;">
                                        <h6>Reply to {{$comment->getUser->name}}</h6>
                                        <form method="POST" action="{{route('backend.document.reply')}}">
                                            @csrf
                                            <input type="hidden" name="parent_id" value="{{$comment->id}}">
                                            <input type="hidden" name="document_id" value="{{$document->id}}">
                                            <div class="mb-3">
                                                <textarea class="form-control" rows="2" placeholder="Your reply" name="reply"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-success btn-sm">Submit Reply</button>
                                        </form>
                                    </div>
                                    <div class="mt-3 replies" style="display: none;">
                                        <h6>Replies</h6>
                                        <ul class="list-group">
                                            @foreach($comment->getReplys as $reply)
                                            <li class="list-group-item">{{$reply->comment}}</li> 
                                            @endforeach
                                        </ul>
                                    </div>
                                    <button class="btn btn-secondary btn-sm mt-2 show-replies-button">Show Replies</button> -->
                                </li>
                                @endforeach
                                 
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @section('javascript-section')
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                document.querySelectorAll('.reply-button').forEach(button => {
                    button.addEventListener('click', function() {
                        const replyForm = this.closest('li').querySelector('.reply-form');
                        replyForm.style.display = replyForm.style.display === 'none' ? 'block' : 'none';
                    });
                });
 
                document.querySelectorAll('.show-replies-button').forEach(button => {
                    button.addEventListener('click', function() {
                        const replies = this.closest('li').querySelector('.replies');
                        replies.style.display = replies.style.display === 'none' ? 'block' : 'none';
                        this.textContent = replies.style.display === 'none' ? 'Show Replies' : 'Hide Replies';
                    });
                });
            });
        </script>

  
    <script>
        $(document).on("click", ".edit_btn", function(){
            const comment_id = $(this).data('id');
            $(".comment").attr('disabled', true);
            $(".update_btn").hide();
            $("#comment_"+comment_id).attr('disabled', false);
            $("#comment_"+comment_id).focus();
            $("#update_btn_"+comment_id).show();
        }); 
    </script>
     
    @endsection
@endsection
