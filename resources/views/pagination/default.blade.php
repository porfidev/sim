@if ($paginator->count() > 1)
<div class="float-right">
    <nav aria-label="Paginacion"
        class="mr-2">
        <ul class="pagination">
            <li class="page-item
            @if ($paginator->getCurrentPage() == 1)
                disabled
            @endif
            ">
                <a class="page-link"
                    href="{{ $paginator->getUrl($paginator->getCurrentPage()-1) }}"
                    aria-label="Anterior"
                    title="Anterior"
                    data-tooltip="tooltip">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Anterior</span>
                </a>
            </li>
            <?php
                $init = $paginator->getCurrentPage()-2;
                if($init <= 0){
                    $init = 1;
                }
                $end = $paginator->getCurrentPage()+2;
                if($end > $paginator->getLastPage()) {
                    $end = $paginator->getLastPage();
                }
            ?>
            @for ($i = $init; $i <= $end; $i++)
            <li class="page-item
                {{($paginator->getCurrentPage() == $i) ? ' active' : '' }}
            ">
                <a class="page-link" data-tooltip="tooltip" href="{{ $paginator->getUrl($i) }}" title="Ir a página {{ $i }}">{{ $i }}</a>
            </li>
            @endfor

            <li class="page-item
            @if ($paginator->getCurrentPage() == $paginator->getLastPage())
                disabled
            @endif
            ">
                <a class="page-link"
                    href="{{ $paginator->getUrl($paginator->getCurrentPage()+1) }}"
                    aria-label="Siguiente"
                    title="Siguiente"
                    data-tooltip="tooltip">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Siguiente</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
@endif