@extends('layouts.master')

@section('content')
<div class="row mt-5 justify-content-center">
	<div class="col-8 mt-5">
		<div class="jumbotron">
			<h1 class="display-4">
				{{{ $titulo }}}
			</h1>
			<p class="lead">
				{{{ $error }}}
			</p>
			<hr class="my-4">
			<p>
				Favor de contactar al administrador para realizar la aclaración.
			</p>
		</div>
	</div>
</div>
@stop