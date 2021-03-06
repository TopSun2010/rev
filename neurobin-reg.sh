#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���_neurobin �X�nG}ﯨ0��B@��e ��qbm�-�N�jiQl�����|{.7�Rۉ�~�@�Yu�kU�����O;�V���`p����Zh��OD	,3QBI �2-��&���������9�Ĺ�TըsYV����]��:<~v���2�P��NZ�3*�c�|<�e��4>�yWS�_{u��9z���0+��9�Rmg�E(PuS��M�|g<����{*�+[�]�Z1�ͭ��
�<���O^��D���������aV�s����ޡ�����d��p���p�/�R�F��nb�7��Hy܄�`j�����Q�Ѥj`4q=o���s�.D�B7+y��l4mu�	7�	���	���4��htP�H�F��)Û�E3�lo�:	���Vא��&��?�j�6G�l���b@�K���]��V���z�J3�lH�2�����y���l}X\7?�=�*?�C�S�Ȝ��4�K���Od |s�IyO�!ẫd�R�����
ۅ2R��12�M�\0p�ɵ5N��ql�\��~X��H���۵�j"i�>4tГvZ=48�4�cb8��ېp8�5��1̛��T�����3>��kp/�Dz}L����5�E��Q|�u�ʜ��2�J/9	�9���V�^.~]����a6x���)M.H˩V)r�&�[ct\*�<eAj��5�	̭J���b�"2M��1�@��6Q�=�pD�����'c��s�B�1���S�:j8։$��b�JTVS�N҄z�X�8\Kg�DI�є+�L��ci��&�p$�r�NX1�ER,�����í.����9R'/�"�X�/�
�&cAq�<��RH8Rgd��ȥ� �B��Y�J�Sg�[�����KE���:��D�����Ǩ�)��0^�դ4V�m	+�y�/�ZP�#(�����b�8uDB�����*m8��F�t$��6C 轁f}�'N�I�"�b��!]e���JF(�Ȥ����΁_�Q��!���1�4�^sq>HL)�х��`��#P3���u)6��F�Bް~�w�`:���,�=�0�Ɂ:�ݼ���#�z���~Ux�.���% ~��xe��n��WO�<�7廗O鯳��6�!�9���l�����7{���~�t���tg�G5D��g�o�yo,^�q:�zSE����1�R�O\� �����[/6�}�AOP'����b2A��!�����q�`p��/ț9|���,��'=��q;E��h�G�r{ -{�������G�zq�>;:<��Jlq6+��-|�͞��~�)��o�ܢ��~�p�N�uv|q�����V�JP6N�7�#[�]�j��(���e{�Fxbc	Gx���x�~e�0��Z����_X۴��f�"N��_�����O��yQƯwm��rZ���kiUF(�_��]�/a��3`��h�E)�_���BL�a�s�&�k�r�v��B)WM�8�"B�g��.a���ߚ���!�[ٴ]@a-.���˛�<U7��]9/�{݄��r���q�)��Ge���dK���jK�K��֤����GP9��Vl�E�}�[�}��H=�u<��P�7��a���������ە�g��Ă�U��/z痕K6K��jj��NY�Ak�6�n_��=Z���#��[|/ʳX��M7v���Bר}����}�V爢vp�^A���j����n�_v}/mٙ��:++w���L��F������<�Η��-���v�/��m�})v��|
�gq����'
��A������;Ә��H5<�u  