ω¬*
ΌGG
:
Add
x"T
y"T
z"T"
Ttype:
2	
W
AddN
inputs"T*N
sum"T"
Nint(0"!
Ttype:
2	
B
AddV2
x"T
y"T
z"T"
Ttype:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW

BoostedTreesBucketize
float_values*num_features#
bucket_boundaries*num_features
buckets*num_features"
num_featuresint(
h
BoostedTreesCreateEnsemble
tree_ensemble_handle
stamp_token	
tree_ensemble_serialized

(BoostedTreesCreateQuantileStreamResource#
quantile_stream_resource_handle
epsilon
num_streams	"
max_elementsint 
m
BoostedTreesDeserializeEnsemble
tree_ensemble_handle
stamp_token	
tree_ensemble_serialized
k
$BoostedTreesEnsembleResourceHandleOp
resource"
	containerstring "
shared_namestring 
­
BoostedTreesPredict
tree_ensemble_handle0
bucketized_features*num_bucketized_features

logits""
num_bucketized_featuresint(0"
logits_dimensionint

-BoostedTreesQuantileStreamResourceDeserialize#
quantile_stream_resource_handle"
bucket_boundaries*num_streams"
num_streamsint(0

5BoostedTreesQuantileStreamResourceGetBucketBoundaries#
quantile_stream_resource_handle#
bucket_boundaries*num_features"
num_featuresint(
q
*BoostedTreesQuantileStreamResourceHandleOp
resource"
	containerstring "
shared_namestring 
k
BoostedTreesSerializeEnsemble
tree_ensemble_handle
stamp_token	
tree_ensemble_serialized
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
ό
DecodeProtoMap
serialized_map_entries
map_entries_parent_indices	
values"output_type*num_keys
indices	*num_keys"
message_typestring"
keyslist(string)("
num_keysint(0"
output_typetype"
descriptor_literalstring
ΐ
DecodeProtoSparseV2	
bytes
values2output_types
indices	*
num_fields"
message_typestring"
field_nameslist(string)"

num_fieldsint(0"
output_types
list(type)(" 
descriptor_literalstring "'
descriptor_sourcestring
local://""
message_formatstringbinary"
sanitizebool( 
R
Equal
x"T
y"T
z
"	
Ttype"$
incompatible_shape_errorbool(
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
p
GatherNd
params"Tparams
indices"Tindices
output"Tparams"
Tparamstype"
Tindicestype:
2	
­
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
‘
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype
.
Identity

input"T
output"T"	
Ttype
Ι
InitializeTableFromTextFileV2
table_handle
filename"
	key_indexint(0ώ????????"
value_indexint(0ώ????????"+

vocab_sizeint?????????(0?????????"
	delimiterstring	
T
!IsBoostedTreesEnsembleInitialized
tree_ensemble_handle
is_initialized

m
/IsBoostedTreesQuantileStreamResourceInitialized#
quantile_stream_resource_handle
is_initialized

:
Less
x"T
y"T
z
"
Ttype:
2	
,
Log
x"T
y"T"
Ttype:

2
#
	LogicalOr
x

y

z

w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype
2
LookupTableSizeV2
table_handle
size	
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
:
Maximum
x"T
y"T
z"T"
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
:
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
U
NotEqual
x"T
y"T
z
"	
Ttype"$
incompatible_shape_errorbool(
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
³
PartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
₯
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
=
RunLengthBefore
ordered_indices	
run_length_before	
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
A
SelectV2
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
·
SparseFillEmptyRows
indices	
values"T
dense_shape	
default_value"T
output_indices	
output_values"T
empty_row_indicator

reverse_index_map	"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
―
SparseSegmentSum	
data"T
indices"Tidx
segment_ids"Tsegmentids
output"T"
Ttype:
2	"
Tidxtype0:
2	"
Tsegmentidstype0:
2	
Ό
SparseToDense
sparse_indices"Tindices
output_shape"Tindices
sparse_values"T
default_value"T

dense"T"
validate_indicesbool("	
Ttype"
Tindicestype:
2	
-
Sqrt
x"T
y"T"
Ttype:

2
3
Square
x"T
y"T"
Ttype:
2
	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
ΐ
StatelessIf
cond"Tcond
input2Tin
output2Tout"
Tcondtype"
Tin
list(type)("
Tout
list(type)("
then_branchfunc"
else_branchfunc" 
output_shapeslist(shape)
 
@
StaticRegexFullMatch	
input

output
"
patternstring
φ
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
W
StringToNumber
string_tensor
output"out_type"
out_typetype0:
2	
;
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 
9
VarIsInitializedOp
resource
is_initialized

E
Where

input"T	
index	"%
Ttype0
:
2	

&
	ZerosLike
x"T
y"T"	
Ttype"serve*2.4.12v2.4.0-49-g85c8b2a817f8Δ(
f
PlaceholderPlaceholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
Θ
ConstConst*
_output_shapes
: *
dtype0*
valueB Bgs://caip-tenant-bbe5406e-146e-45f5-a077-07ce92654302/transform_output/5462449083337670656/output_data_view/variables/variables
β
PartitionedCallPartitionedCallPlaceholder*
Tin
2*0
Tout(
&2$																								*φ
_output_shapesγ
ΰ:?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????::?????????:?????????:* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *'
f"R 
__inference_decode_record_7607
Ζ
Const_1Const*
_output_shapes
: *
dtype0*
valueB B{gs://caip-tenant-bbe5406e-146e-45f5-a077-07ce92654302/transform_output/5462449083337670656/transform_fn/assets/preset_vocab
°
transform/ConstConst*
_output_shapes

:*
dtype0*i
value`B^"PΓͺ?]T?^B1Ca@θwΧDέθ@c2ΤD87μ@Ά¦BΡm@ϋBAΏ@£pDV°Χ@άΦ«J~fuAΘ)Jk`A @Ξέ?
²
transform/Const_1Const*
_output_shapes

:*
dtype0*i
value`B^"PΟc>Ο=’€ΞBqT=zIGπΜ>ΕqHυπ=/+D6ΐ=ΫΥBe?0ΥH57w>ήΰ	UWκπ>―ΕT1?UΗ@ Ό>
S
transform/Const_2Const*
_output_shapes
: *
dtype0	*
value	B	 R
Π
transform/Const_3Const*
_output_shapes
: *
dtype0*
valueB B{gs://caip-tenant-bbe5406e-146e-45f5-a077-07ce92654302/transform_output/5462449083337670656/tmp/tftransform_tmp/preset_vocab

&transform/transform/inputs/cores/coresPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

(transform/transform/inputs/cores/cores_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
q
(transform/transform/inputs/cores/cores_2Placeholder*
_output_shapes
:*
dtype0	*
shape:
₯
Btransform/transform/inputs/F_downscaled_avg_si/F_downscaled_avg_siPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

Dtransform/transform/inputs/F_downscaled_avg_si/F_downscaled_avg_si_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????

Dtransform/transform/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2Placeholder*
_output_shapes
:*
dtype0	*
shape:
₯
Btransform/transform/inputs/F_downscaled_avg_ti/F_downscaled_avg_tiPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

Dtransform/transform/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????

Dtransform/transform/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2Placeholder*
_output_shapes
:*
dtype0	*
shape:
§
Dtransform/transform/inputs/F_downscaled_bitrate/F_downscaled_bitratePlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????
‘
Ftransform/transform/inputs/F_downscaled_bitrate/F_downscaled_bitrate_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????

Ftransform/transform/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

,transform/transform/inputs/duration/durationPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

.transform/transform/inputs/duration/duration_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
w
.transform/transform/inputs/duration/duration_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

"transform/transform/inputs/fps/fpsPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

$transform/transform/inputs/fps/fps_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
m
$transform/transform/inputs/fps/fps_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

(transform/transform/inputs/height/heightPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

*transform/transform/inputs/height/height_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
s
*transform/transform/inputs/height/height_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

:transform/transform/inputs/F_output_height/F_output_heightPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

<transform/transform/inputs/F_output_height/F_output_height_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????

<transform/transform/inputs/F_output_height/F_output_height_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

:transform/transform/inputs/F_output_pixels/F_output_pixelsPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

<transform/transform/inputs/F_output_pixels/F_output_pixels_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????

<transform/transform/inputs/F_output_pixels/F_output_pixels_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

(transform/transform/inputs/pixels/pixelsPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

*transform/transform/inputs/pixels/pixels_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
s
*transform/transform/inputs/pixels/pixels_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

(transform/transform/inputs/preset/presetPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????

*transform/transform/inputs/preset/preset_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
s
*transform/transform/inputs/preset/preset_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

 transform/transform/inputs/tt/ttPlaceholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????
}
"transform/transform/inputs/tt/tt_1Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
k
"transform/transform/inputs/tt/tt_2Placeholder*
_output_shapes
:*
dtype0	*
shape:

2transform/transform/inputs/inputs/cores/cores_copyIdentityPartitionedCall*
T0	*'
_output_shapes
:?????????

4transform/transform/inputs/inputs/cores/cores_1_copyIdentityPartitionedCall:1*
T0*#
_output_shapes
:?????????
x
4transform/transform/inputs/inputs/cores/cores_2_copyIdentityPartitionedCall:2*
T0	*
_output_shapes
:

Ntransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copyIdentityPartitionedCall:3*
T0	*'
_output_shapes
:?????????

Ptransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_1_copyIdentityPartitionedCall:4*
T0*#
_output_shapes
:?????????

Ptransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2_copyIdentityPartitionedCall:5*
T0	*
_output_shapes
:

Ntransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copyIdentityPartitionedCall:6*
T0	*'
_output_shapes
:?????????

Ptransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_1_copyIdentityPartitionedCall:7*
T0*#
_output_shapes
:?????????

Ptransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2_copyIdentityPartitionedCall:8*
T0	*
_output_shapes
:
‘
Ptransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copyIdentityPartitionedCall:9*
T0	*'
_output_shapes
:?????????
 
Rtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_1_copyIdentityPartitionedCall:10*
T0*#
_output_shapes
:?????????

Rtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2_copyIdentityPartitionedCall:11*
T0	*
_output_shapes
:

8transform/transform/inputs/inputs/duration/duration_copyIdentityPartitionedCall:12*
T0	*'
_output_shapes
:?????????

:transform/transform/inputs/inputs/duration/duration_1_copyIdentityPartitionedCall:13*
T0*#
_output_shapes
:?????????

:transform/transform/inputs/inputs/duration/duration_2_copyIdentityPartitionedCall:14*
T0	*
_output_shapes
:

.transform/transform/inputs/inputs/fps/fps_copyIdentityPartitionedCall:15*
T0	*'
_output_shapes
:?????????
~
0transform/transform/inputs/inputs/fps/fps_1_copyIdentityPartitionedCall:16*
T0*#
_output_shapes
:?????????
u
0transform/transform/inputs/inputs/fps/fps_2_copyIdentityPartitionedCall:17*
T0	*
_output_shapes
:

4transform/transform/inputs/inputs/height/height_copyIdentityPartitionedCall:18*
T0	*'
_output_shapes
:?????????

6transform/transform/inputs/inputs/height/height_1_copyIdentityPartitionedCall:19*
T0*#
_output_shapes
:?????????
{
6transform/transform/inputs/inputs/height/height_2_copyIdentityPartitionedCall:20*
T0	*
_output_shapes
:

Ftransform/transform/inputs/inputs/F_output_height/F_output_height_copyIdentityPartitionedCall:21*
T0	*'
_output_shapes
:?????????

Htransform/transform/inputs/inputs/F_output_height/F_output_height_1_copyIdentityPartitionedCall:22*
T0*#
_output_shapes
:?????????

Htransform/transform/inputs/inputs/F_output_height/F_output_height_2_copyIdentityPartitionedCall:23*
T0	*
_output_shapes
:

Ftransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copyIdentityPartitionedCall:24*
T0	*'
_output_shapes
:?????????

Htransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_1_copyIdentityPartitionedCall:25*
T0*#
_output_shapes
:?????????

Htransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_2_copyIdentityPartitionedCall:26*
T0	*
_output_shapes
:

4transform/transform/inputs/inputs/pixels/pixels_copyIdentityPartitionedCall:27*
T0	*'
_output_shapes
:?????????

6transform/transform/inputs/inputs/pixels/pixels_1_copyIdentityPartitionedCall:28*
T0*#
_output_shapes
:?????????
{
6transform/transform/inputs/inputs/pixels/pixels_2_copyIdentityPartitionedCall:29*
T0	*
_output_shapes
:

4transform/transform/inputs/inputs/preset/preset_copyIdentityPartitionedCall:30*
T0	*'
_output_shapes
:?????????

6transform/transform/inputs/inputs/preset/preset_1_copyIdentityPartitionedCall:31*
T0*#
_output_shapes
:?????????
{
6transform/transform/inputs/inputs/preset/preset_2_copyIdentityPartitionedCall:32*
T0	*
_output_shapes
:
~
,transform/transform/inputs/inputs/tt/tt_copyIdentityPartitionedCall:33*
T0	*'
_output_shapes
:?????????
|
.transform/transform/inputs/inputs/tt/tt_1_copyIdentityPartitionedCall:34*
T0*#
_output_shapes
:?????????
s
.transform/transform/inputs/inputs/tt/tt_2_copyIdentityPartitionedCall:35*
T0	*
_output_shapes
:

"transform/transform/StringToNumberStringToNumber4transform/transform/inputs/inputs/cores/cores_1_copy*#
_output_shapes
:?????????
­
$transform/transform/StringToNumber_1StringToNumberPtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_1_copy*#
_output_shapes
:?????????
­
$transform/transform/StringToNumber_2StringToNumberPtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_1_copy*#
_output_shapes
:?????????
―
$transform/transform/StringToNumber_3StringToNumberRtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_1_copy*#
_output_shapes
:?????????

$transform/transform/StringToNumber_4StringToNumber:transform/transform/inputs/inputs/duration/duration_1_copy*#
_output_shapes
:?????????

$transform/transform/StringToNumber_5StringToNumber0transform/transform/inputs/inputs/fps/fps_1_copy*#
_output_shapes
:?????????

$transform/transform/StringToNumber_6StringToNumber6transform/transform/inputs/inputs/height/height_1_copy*#
_output_shapes
:?????????
₯
$transform/transform/StringToNumber_7StringToNumberHtransform/transform/inputs/inputs/F_output_height/F_output_height_1_copy*#
_output_shapes
:?????????
₯
$transform/transform/StringToNumber_8StringToNumberHtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_1_copy*#
_output_shapes
:?????????

$transform/transform/StringToNumber_9StringToNumber6transform/transform/inputs/inputs/pixels/pixels_1_copy*#
_output_shapes
:?????????

%transform/transform/StringToNumber_10StringToNumber.transform/transform/inputs/inputs/tt/tt_1_copy*#
_output_shapes
:?????????
g
"transform/transform/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¨
 transform/transform/GreaterEqualGreaterEqual$transform/transform/StringToNumber_4"transform/transform/GreaterEqual/y*
T0*#
_output_shapes
:?????????
z
&transform/transform/boolean_mask/ShapeShape$transform/transform/StringToNumber_4*
T0*
_output_shapes
:
~
4transform/transform/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

6transform/transform/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

6transform/transform/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ύ
.transform/transform/boolean_mask/strided_sliceStridedSlice&transform/transform/boolean_mask/Shape4transform/transform/boolean_mask/strided_slice/stack6transform/transform/boolean_mask/strided_slice/stack_16transform/transform/boolean_mask/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

7transform/transform/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
·
%transform/transform/boolean_mask/ProdProd.transform/transform/boolean_mask/strided_slice7transform/transform/boolean_mask/Prod/reduction_indices*
T0*
_output_shapes
: 
|
(transform/transform/boolean_mask/Shape_1Shape$transform/transform/StringToNumber_4*
T0*
_output_shapes
:

6transform/transform/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ψ
0transform/transform/boolean_mask/strided_slice_1StridedSlice(transform/transform/boolean_mask/Shape_16transform/transform/boolean_mask/strided_slice_1/stack8transform/transform/boolean_mask/strided_slice_1/stack_18transform/transform/boolean_mask/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
|
(transform/transform/boolean_mask/Shape_2Shape$transform/transform/StringToNumber_4*
T0*
_output_shapes
:

6transform/transform/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Φ
0transform/transform/boolean_mask/strided_slice_2StridedSlice(transform/transform/boolean_mask/Shape_26transform/transform/boolean_mask/strided_slice_2/stack8transform/transform/boolean_mask/strided_slice_2/stack_18transform/transform/boolean_mask/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

0transform/transform/boolean_mask/concat/values_1Pack%transform/transform/boolean_mask/Prod*
N*
T0*
_output_shapes
:
n
,transform/transform/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
₯
'transform/transform/boolean_mask/concatConcatV20transform/transform/boolean_mask/strided_slice_10transform/transform/boolean_mask/concat/values_10transform/transform/boolean_mask/strided_slice_2,transform/transform/boolean_mask/concat/axis*
N*
T0*
_output_shapes
:
°
(transform/transform/boolean_mask/ReshapeReshape$transform/transform/StringToNumber_4'transform/transform/boolean_mask/concat*
T0*#
_output_shapes
:?????????

0transform/transform/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
·
*transform/transform/boolean_mask/Reshape_1Reshape transform/transform/GreaterEqual0transform/transform/boolean_mask/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

&transform/transform/boolean_mask/WhereWhere*transform/transform/boolean_mask/Reshape_1*'
_output_shapes
:?????????
 
(transform/transform/boolean_mask/SqueezeSqueeze&transform/transform/boolean_mask/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

p
.transform/transform/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

)transform/transform/boolean_mask/GatherV2GatherV2(transform/transform/boolean_mask/Reshape(transform/transform/boolean_mask/Squeeze.transform/transform/boolean_mask/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
^
transform/transform/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/addAddV2)transform/transform/boolean_mask/GatherV2transform/transform/add/y*
T0*#
_output_shapes
:?????????
e
transform/transform/LogLogtransform/transform/add*
T0*#
_output_shapes
:?????????

(transform/transform/boolean_mask_1/ShapeShape8transform/transform/inputs/inputs/duration/duration_copy*
T0	*
_output_shapes
:

6transform/transform/boolean_mask_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_1/strided_sliceStridedSlice(transform/transform/boolean_mask_1/Shape6transform/transform/boolean_mask_1/strided_slice/stack8transform/transform/boolean_mask_1/strided_slice/stack_18transform/transform/boolean_mask_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_1/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_1/ProdProd0transform/transform/boolean_mask_1/strided_slice9transform/transform/boolean_mask_1/Prod/reduction_indices*
T0*
_output_shapes
: 

*transform/transform/boolean_mask_1/Shape_1Shape8transform/transform/inputs/inputs/duration/duration_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_1/strided_slice_1StridedSlice*transform/transform/boolean_mask_1/Shape_18transform/transform/boolean_mask_1/strided_slice_1/stack:transform/transform/boolean_mask_1/strided_slice_1/stack_1:transform/transform/boolean_mask_1/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

*transform/transform/boolean_mask_1/Shape_2Shape8transform/transform/inputs/inputs/duration/duration_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_1/strided_slice_2StridedSlice*transform/transform/boolean_mask_1/Shape_28transform/transform/boolean_mask_1/strided_slice_2/stack:transform/transform/boolean_mask_1/strided_slice_2/stack_1:transform/transform/boolean_mask_1/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

2transform/transform/boolean_mask_1/concat/values_1Pack'transform/transform/boolean_mask_1/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_1/concatConcatV22transform/transform/boolean_mask_1/strided_slice_12transform/transform/boolean_mask_1/concat/values_12transform/transform/boolean_mask_1/strided_slice_2.transform/transform/boolean_mask_1/concat/axis*
N*
T0*
_output_shapes
:
Μ
*transform/transform/boolean_mask_1/ReshapeReshape8transform/transform/inputs/inputs/duration/duration_copy)transform/transform/boolean_mask_1/concat*
T0	*'
_output_shapes
:?????????

2transform/transform/boolean_mask_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
»
,transform/transform/boolean_mask_1/Reshape_1Reshape transform/transform/GreaterEqual2transform/transform/boolean_mask_1/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_1/WhereWhere,transform/transform/boolean_mask_1/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_1/SqueezeSqueeze(transform/transform/boolean_mask_1/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_1/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_1/GatherV2GatherV2*transform/transform/boolean_mask_1/Reshape*transform/transform/boolean_mask_1/Squeeze0transform/transform/boolean_mask_1/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_1GreaterEqual$transform/transform/StringToNumber_5$transform/transform/GreaterEqual_1/y*
T0*#
_output_shapes
:?????????
|
(transform/transform/boolean_mask_2/ShapeShape$transform/transform/StringToNumber_5*
T0*
_output_shapes
:

6transform/transform/boolean_mask_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_2/strided_sliceStridedSlice(transform/transform/boolean_mask_2/Shape6transform/transform/boolean_mask_2/strided_slice/stack8transform/transform/boolean_mask_2/strided_slice/stack_18transform/transform/boolean_mask_2/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_2/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_2/ProdProd0transform/transform/boolean_mask_2/strided_slice9transform/transform/boolean_mask_2/Prod/reduction_indices*
T0*
_output_shapes
: 
~
*transform/transform/boolean_mask_2/Shape_1Shape$transform/transform/StringToNumber_5*
T0*
_output_shapes
:

8transform/transform/boolean_mask_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_2/strided_slice_1StridedSlice*transform/transform/boolean_mask_2/Shape_18transform/transform/boolean_mask_2/strided_slice_1/stack:transform/transform/boolean_mask_2/strided_slice_1/stack_1:transform/transform/boolean_mask_2/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
~
*transform/transform/boolean_mask_2/Shape_2Shape$transform/transform/StringToNumber_5*
T0*
_output_shapes
:

8transform/transform/boolean_mask_2/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_2/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_2/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ΰ
2transform/transform/boolean_mask_2/strided_slice_2StridedSlice*transform/transform/boolean_mask_2/Shape_28transform/transform/boolean_mask_2/strided_slice_2/stack:transform/transform/boolean_mask_2/strided_slice_2/stack_1:transform/transform/boolean_mask_2/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

2transform/transform/boolean_mask_2/concat/values_1Pack'transform/transform/boolean_mask_2/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_2/concatConcatV22transform/transform/boolean_mask_2/strided_slice_12transform/transform/boolean_mask_2/concat/values_12transform/transform/boolean_mask_2/strided_slice_2.transform/transform/boolean_mask_2/concat/axis*
N*
T0*
_output_shapes
:
΄
*transform/transform/boolean_mask_2/ReshapeReshape$transform/transform/StringToNumber_5)transform/transform/boolean_mask_2/concat*
T0*#
_output_shapes
:?????????

2transform/transform/boolean_mask_2/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_2/Reshape_1Reshape"transform/transform/GreaterEqual_12transform/transform/boolean_mask_2/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_2/WhereWhere,transform/transform/boolean_mask_2/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_2/SqueezeSqueeze(transform/transform/boolean_mask_2/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_2/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_2/GatherV2GatherV2*transform/transform/boolean_mask_2/Reshape*transform/transform/boolean_mask_2/Squeeze0transform/transform/boolean_mask_2/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_1AddV2+transform/transform/boolean_mask_2/GatherV2transform/transform/add_1/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_1Logtransform/transform/add_1*
T0*#
_output_shapes
:?????????

(transform/transform/boolean_mask_3/ShapeShape.transform/transform/inputs/inputs/fps/fps_copy*
T0	*
_output_shapes
:

6transform/transform/boolean_mask_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_3/strided_sliceStridedSlice(transform/transform/boolean_mask_3/Shape6transform/transform/boolean_mask_3/strided_slice/stack8transform/transform/boolean_mask_3/strided_slice/stack_18transform/transform/boolean_mask_3/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_3/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_3/ProdProd0transform/transform/boolean_mask_3/strided_slice9transform/transform/boolean_mask_3/Prod/reduction_indices*
T0*
_output_shapes
: 

*transform/transform/boolean_mask_3/Shape_1Shape.transform/transform/inputs/inputs/fps/fps_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_3/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_3/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_3/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_3/strided_slice_1StridedSlice*transform/transform/boolean_mask_3/Shape_18transform/transform/boolean_mask_3/strided_slice_1/stack:transform/transform/boolean_mask_3/strided_slice_1/stack_1:transform/transform/boolean_mask_3/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

*transform/transform/boolean_mask_3/Shape_2Shape.transform/transform/inputs/inputs/fps/fps_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_3/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_3/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_3/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_3/strided_slice_2StridedSlice*transform/transform/boolean_mask_3/Shape_28transform/transform/boolean_mask_3/strided_slice_2/stack:transform/transform/boolean_mask_3/strided_slice_2/stack_1:transform/transform/boolean_mask_3/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

2transform/transform/boolean_mask_3/concat/values_1Pack'transform/transform/boolean_mask_3/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_3/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_3/concatConcatV22transform/transform/boolean_mask_3/strided_slice_12transform/transform/boolean_mask_3/concat/values_12transform/transform/boolean_mask_3/strided_slice_2.transform/transform/boolean_mask_3/concat/axis*
N*
T0*
_output_shapes
:
Β
*transform/transform/boolean_mask_3/ReshapeReshape.transform/transform/inputs/inputs/fps/fps_copy)transform/transform/boolean_mask_3/concat*
T0	*'
_output_shapes
:?????????

2transform/transform/boolean_mask_3/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_3/Reshape_1Reshape"transform/transform/GreaterEqual_12transform/transform/boolean_mask_3/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_3/WhereWhere,transform/transform/boolean_mask_3/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_3/SqueezeSqueeze(transform/transform/boolean_mask_3/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_3/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_3/GatherV2GatherV2*transform/transform/boolean_mask_3/Reshape*transform/transform/boolean_mask_3/Squeeze0transform/transform/boolean_mask_3/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_2GreaterEqual$transform/transform/StringToNumber_3$transform/transform/GreaterEqual_2/y*
T0*#
_output_shapes
:?????????
|
(transform/transform/boolean_mask_4/ShapeShape$transform/transform/StringToNumber_3*
T0*
_output_shapes
:

6transform/transform/boolean_mask_4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_4/strided_sliceStridedSlice(transform/transform/boolean_mask_4/Shape6transform/transform/boolean_mask_4/strided_slice/stack8transform/transform/boolean_mask_4/strided_slice/stack_18transform/transform/boolean_mask_4/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_4/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_4/ProdProd0transform/transform/boolean_mask_4/strided_slice9transform/transform/boolean_mask_4/Prod/reduction_indices*
T0*
_output_shapes
: 
~
*transform/transform/boolean_mask_4/Shape_1Shape$transform/transform/StringToNumber_3*
T0*
_output_shapes
:

8transform/transform/boolean_mask_4/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_4/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_4/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_4/strided_slice_1StridedSlice*transform/transform/boolean_mask_4/Shape_18transform/transform/boolean_mask_4/strided_slice_1/stack:transform/transform/boolean_mask_4/strided_slice_1/stack_1:transform/transform/boolean_mask_4/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
~
*transform/transform/boolean_mask_4/Shape_2Shape$transform/transform/StringToNumber_3*
T0*
_output_shapes
:

8transform/transform/boolean_mask_4/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_4/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_4/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ΰ
2transform/transform/boolean_mask_4/strided_slice_2StridedSlice*transform/transform/boolean_mask_4/Shape_28transform/transform/boolean_mask_4/strided_slice_2/stack:transform/transform/boolean_mask_4/strided_slice_2/stack_1:transform/transform/boolean_mask_4/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

2transform/transform/boolean_mask_4/concat/values_1Pack'transform/transform/boolean_mask_4/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_4/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_4/concatConcatV22transform/transform/boolean_mask_4/strided_slice_12transform/transform/boolean_mask_4/concat/values_12transform/transform/boolean_mask_4/strided_slice_2.transform/transform/boolean_mask_4/concat/axis*
N*
T0*
_output_shapes
:
΄
*transform/transform/boolean_mask_4/ReshapeReshape$transform/transform/StringToNumber_3)transform/transform/boolean_mask_4/concat*
T0*#
_output_shapes
:?????????

2transform/transform/boolean_mask_4/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_4/Reshape_1Reshape"transform/transform/GreaterEqual_22transform/transform/boolean_mask_4/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_4/WhereWhere,transform/transform/boolean_mask_4/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_4/SqueezeSqueeze(transform/transform/boolean_mask_4/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_4/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_4/GatherV2GatherV2*transform/transform/boolean_mask_4/Reshape*transform/transform/boolean_mask_4/Squeeze0transform/transform/boolean_mask_4/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_2AddV2+transform/transform/boolean_mask_4/GatherV2transform/transform/add_2/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_2Logtransform/transform/add_2*
T0*#
_output_shapes
:?????????
¨
(transform/transform/boolean_mask_5/ShapeShapePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy*
T0	*
_output_shapes
:

6transform/transform/boolean_mask_5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_5/strided_sliceStridedSlice(transform/transform/boolean_mask_5/Shape6transform/transform/boolean_mask_5/strided_slice/stack8transform/transform/boolean_mask_5/strided_slice/stack_18transform/transform/boolean_mask_5/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_5/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_5/ProdProd0transform/transform/boolean_mask_5/strided_slice9transform/transform/boolean_mask_5/Prod/reduction_indices*
T0*
_output_shapes
: 
ͺ
*transform/transform/boolean_mask_5/Shape_1ShapePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_5/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_5/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_5/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_5/strided_slice_1StridedSlice*transform/transform/boolean_mask_5/Shape_18transform/transform/boolean_mask_5/strided_slice_1/stack:transform/transform/boolean_mask_5/strided_slice_1/stack_1:transform/transform/boolean_mask_5/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
ͺ
*transform/transform/boolean_mask_5/Shape_2ShapePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_5/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_5/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_5/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_5/strided_slice_2StridedSlice*transform/transform/boolean_mask_5/Shape_28transform/transform/boolean_mask_5/strided_slice_2/stack:transform/transform/boolean_mask_5/strided_slice_2/stack_1:transform/transform/boolean_mask_5/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

2transform/transform/boolean_mask_5/concat/values_1Pack'transform/transform/boolean_mask_5/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_5/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_5/concatConcatV22transform/transform/boolean_mask_5/strided_slice_12transform/transform/boolean_mask_5/concat/values_12transform/transform/boolean_mask_5/strided_slice_2.transform/transform/boolean_mask_5/concat/axis*
N*
T0*
_output_shapes
:
δ
*transform/transform/boolean_mask_5/ReshapeReshapePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy)transform/transform/boolean_mask_5/concat*
T0	*'
_output_shapes
:?????????

2transform/transform/boolean_mask_5/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_5/Reshape_1Reshape"transform/transform/GreaterEqual_22transform/transform/boolean_mask_5/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_5/WhereWhere,transform/transform/boolean_mask_5/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_5/SqueezeSqueeze(transform/transform/boolean_mask_5/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_5/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_5/GatherV2GatherV2*transform/transform/boolean_mask_5/Reshape*transform/transform/boolean_mask_5/Squeeze0transform/transform/boolean_mask_5/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_3GreaterEqual$transform/transform/StringToNumber_6$transform/transform/GreaterEqual_3/y*
T0*#
_output_shapes
:?????????
|
(transform/transform/boolean_mask_6/ShapeShape$transform/transform/StringToNumber_6*
T0*
_output_shapes
:

6transform/transform/boolean_mask_6/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_6/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_6/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_6/strided_sliceStridedSlice(transform/transform/boolean_mask_6/Shape6transform/transform/boolean_mask_6/strided_slice/stack8transform/transform/boolean_mask_6/strided_slice/stack_18transform/transform/boolean_mask_6/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_6/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_6/ProdProd0transform/transform/boolean_mask_6/strided_slice9transform/transform/boolean_mask_6/Prod/reduction_indices*
T0*
_output_shapes
: 
~
*transform/transform/boolean_mask_6/Shape_1Shape$transform/transform/StringToNumber_6*
T0*
_output_shapes
:

8transform/transform/boolean_mask_6/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_6/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_6/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_6/strided_slice_1StridedSlice*transform/transform/boolean_mask_6/Shape_18transform/transform/boolean_mask_6/strided_slice_1/stack:transform/transform/boolean_mask_6/strided_slice_1/stack_1:transform/transform/boolean_mask_6/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
~
*transform/transform/boolean_mask_6/Shape_2Shape$transform/transform/StringToNumber_6*
T0*
_output_shapes
:

8transform/transform/boolean_mask_6/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_6/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_6/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ΰ
2transform/transform/boolean_mask_6/strided_slice_2StridedSlice*transform/transform/boolean_mask_6/Shape_28transform/transform/boolean_mask_6/strided_slice_2/stack:transform/transform/boolean_mask_6/strided_slice_2/stack_1:transform/transform/boolean_mask_6/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

2transform/transform/boolean_mask_6/concat/values_1Pack'transform/transform/boolean_mask_6/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_6/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_6/concatConcatV22transform/transform/boolean_mask_6/strided_slice_12transform/transform/boolean_mask_6/concat/values_12transform/transform/boolean_mask_6/strided_slice_2.transform/transform/boolean_mask_6/concat/axis*
N*
T0*
_output_shapes
:
΄
*transform/transform/boolean_mask_6/ReshapeReshape$transform/transform/StringToNumber_6)transform/transform/boolean_mask_6/concat*
T0*#
_output_shapes
:?????????

2transform/transform/boolean_mask_6/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_6/Reshape_1Reshape"transform/transform/GreaterEqual_32transform/transform/boolean_mask_6/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_6/WhereWhere,transform/transform/boolean_mask_6/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_6/SqueezeSqueeze(transform/transform/boolean_mask_6/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_6/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_6/GatherV2GatherV2*transform/transform/boolean_mask_6/Reshape*transform/transform/boolean_mask_6/Squeeze0transform/transform/boolean_mask_6/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_3AddV2+transform/transform/boolean_mask_6/GatherV2transform/transform/add_3/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_3Logtransform/transform/add_3*
T0*#
_output_shapes
:?????????

(transform/transform/boolean_mask_7/ShapeShape4transform/transform/inputs/inputs/height/height_copy*
T0	*
_output_shapes
:

6transform/transform/boolean_mask_7/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_7/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_7/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_7/strided_sliceStridedSlice(transform/transform/boolean_mask_7/Shape6transform/transform/boolean_mask_7/strided_slice/stack8transform/transform/boolean_mask_7/strided_slice/stack_18transform/transform/boolean_mask_7/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_7/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_7/ProdProd0transform/transform/boolean_mask_7/strided_slice9transform/transform/boolean_mask_7/Prod/reduction_indices*
T0*
_output_shapes
: 

*transform/transform/boolean_mask_7/Shape_1Shape4transform/transform/inputs/inputs/height/height_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_7/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_7/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_7/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_7/strided_slice_1StridedSlice*transform/transform/boolean_mask_7/Shape_18transform/transform/boolean_mask_7/strided_slice_1/stack:transform/transform/boolean_mask_7/strided_slice_1/stack_1:transform/transform/boolean_mask_7/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

*transform/transform/boolean_mask_7/Shape_2Shape4transform/transform/inputs/inputs/height/height_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_7/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_7/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_7/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_7/strided_slice_2StridedSlice*transform/transform/boolean_mask_7/Shape_28transform/transform/boolean_mask_7/strided_slice_2/stack:transform/transform/boolean_mask_7/strided_slice_2/stack_1:transform/transform/boolean_mask_7/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

2transform/transform/boolean_mask_7/concat/values_1Pack'transform/transform/boolean_mask_7/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_7/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_7/concatConcatV22transform/transform/boolean_mask_7/strided_slice_12transform/transform/boolean_mask_7/concat/values_12transform/transform/boolean_mask_7/strided_slice_2.transform/transform/boolean_mask_7/concat/axis*
N*
T0*
_output_shapes
:
Θ
*transform/transform/boolean_mask_7/ReshapeReshape4transform/transform/inputs/inputs/height/height_copy)transform/transform/boolean_mask_7/concat*
T0	*'
_output_shapes
:?????????

2transform/transform/boolean_mask_7/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_7/Reshape_1Reshape"transform/transform/GreaterEqual_32transform/transform/boolean_mask_7/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_7/WhereWhere,transform/transform/boolean_mask_7/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_7/SqueezeSqueeze(transform/transform/boolean_mask_7/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_7/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_7/GatherV2GatherV2*transform/transform/boolean_mask_7/Reshape*transform/transform/boolean_mask_7/Squeeze0transform/transform/boolean_mask_7/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_4GreaterEqual$transform/transform/StringToNumber_1$transform/transform/GreaterEqual_4/y*
T0*#
_output_shapes
:?????????
|
(transform/transform/boolean_mask_8/ShapeShape$transform/transform/StringToNumber_1*
T0*
_output_shapes
:

6transform/transform/boolean_mask_8/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_8/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_8/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_8/strided_sliceStridedSlice(transform/transform/boolean_mask_8/Shape6transform/transform/boolean_mask_8/strided_slice/stack8transform/transform/boolean_mask_8/strided_slice/stack_18transform/transform/boolean_mask_8/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_8/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_8/ProdProd0transform/transform/boolean_mask_8/strided_slice9transform/transform/boolean_mask_8/Prod/reduction_indices*
T0*
_output_shapes
: 
~
*transform/transform/boolean_mask_8/Shape_1Shape$transform/transform/StringToNumber_1*
T0*
_output_shapes
:

8transform/transform/boolean_mask_8/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_8/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_8/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_8/strided_slice_1StridedSlice*transform/transform/boolean_mask_8/Shape_18transform/transform/boolean_mask_8/strided_slice_1/stack:transform/transform/boolean_mask_8/strided_slice_1/stack_1:transform/transform/boolean_mask_8/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
~
*transform/transform/boolean_mask_8/Shape_2Shape$transform/transform/StringToNumber_1*
T0*
_output_shapes
:

8transform/transform/boolean_mask_8/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_8/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_8/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ΰ
2transform/transform/boolean_mask_8/strided_slice_2StridedSlice*transform/transform/boolean_mask_8/Shape_28transform/transform/boolean_mask_8/strided_slice_2/stack:transform/transform/boolean_mask_8/strided_slice_2/stack_1:transform/transform/boolean_mask_8/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

2transform/transform/boolean_mask_8/concat/values_1Pack'transform/transform/boolean_mask_8/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_8/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_8/concatConcatV22transform/transform/boolean_mask_8/strided_slice_12transform/transform/boolean_mask_8/concat/values_12transform/transform/boolean_mask_8/strided_slice_2.transform/transform/boolean_mask_8/concat/axis*
N*
T0*
_output_shapes
:
΄
*transform/transform/boolean_mask_8/ReshapeReshape$transform/transform/StringToNumber_1)transform/transform/boolean_mask_8/concat*
T0*#
_output_shapes
:?????????

2transform/transform/boolean_mask_8/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_8/Reshape_1Reshape"transform/transform/GreaterEqual_42transform/transform/boolean_mask_8/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_8/WhereWhere,transform/transform/boolean_mask_8/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_8/SqueezeSqueeze(transform/transform/boolean_mask_8/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_8/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_8/GatherV2GatherV2*transform/transform/boolean_mask_8/Reshape*transform/transform/boolean_mask_8/Squeeze0transform/transform/boolean_mask_8/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_4AddV2+transform/transform/boolean_mask_8/GatherV2transform/transform/add_4/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_4Logtransform/transform/add_4*
T0*#
_output_shapes
:?????????
¦
(transform/transform/boolean_mask_9/ShapeShapeNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy*
T0	*
_output_shapes
:

6transform/transform/boolean_mask_9/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

8transform/transform/boolean_mask_9/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

8transform/transform/boolean_mask_9/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Θ
0transform/transform/boolean_mask_9/strided_sliceStridedSlice(transform/transform/boolean_mask_9/Shape6transform/transform/boolean_mask_9/strided_slice/stack8transform/transform/boolean_mask_9/strided_slice/stack_18transform/transform/boolean_mask_9/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

9transform/transform/boolean_mask_9/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
½
'transform/transform/boolean_mask_9/ProdProd0transform/transform/boolean_mask_9/strided_slice9transform/transform/boolean_mask_9/Prod/reduction_indices*
T0*
_output_shapes
: 
¨
*transform/transform/boolean_mask_9/Shape_1ShapeNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_9/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_9/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_9/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_9/strided_slice_1StridedSlice*transform/transform/boolean_mask_9/Shape_18transform/transform/boolean_mask_9/strided_slice_1/stack:transform/transform/boolean_mask_9/strided_slice_1/stack_1:transform/transform/boolean_mask_9/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
¨
*transform/transform/boolean_mask_9/Shape_2ShapeNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy*
T0	*
_output_shapes
:

8transform/transform/boolean_mask_9/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

:transform/transform/boolean_mask_9/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

:transform/transform/boolean_mask_9/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
β
2transform/transform/boolean_mask_9/strided_slice_2StridedSlice*transform/transform/boolean_mask_9/Shape_28transform/transform/boolean_mask_9/strided_slice_2/stack:transform/transform/boolean_mask_9/strided_slice_2/stack_1:transform/transform/boolean_mask_9/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

2transform/transform/boolean_mask_9/concat/values_1Pack'transform/transform/boolean_mask_9/Prod*
N*
T0*
_output_shapes
:
p
.transform/transform/boolean_mask_9/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
―
)transform/transform/boolean_mask_9/concatConcatV22transform/transform/boolean_mask_9/strided_slice_12transform/transform/boolean_mask_9/concat/values_12transform/transform/boolean_mask_9/strided_slice_2.transform/transform/boolean_mask_9/concat/axis*
N*
T0*
_output_shapes
:
β
*transform/transform/boolean_mask_9/ReshapeReshapeNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy)transform/transform/boolean_mask_9/concat*
T0	*'
_output_shapes
:?????????

2transform/transform/boolean_mask_9/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
½
,transform/transform/boolean_mask_9/Reshape_1Reshape"transform/transform/GreaterEqual_42transform/transform/boolean_mask_9/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

(transform/transform/boolean_mask_9/WhereWhere,transform/transform/boolean_mask_9/Reshape_1*'
_output_shapes
:?????????
€
*transform/transform/boolean_mask_9/SqueezeSqueeze(transform/transform/boolean_mask_9/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

r
0transform/transform/boolean_mask_9/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

+transform/transform/boolean_mask_9/GatherV2GatherV2*transform/transform/boolean_mask_9/Reshape*transform/transform/boolean_mask_9/Squeeze0transform/transform/boolean_mask_9/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_5GreaterEqual$transform/transform/StringToNumber_2$transform/transform/GreaterEqual_5/y*
T0*#
_output_shapes
:?????????
}
)transform/transform/boolean_mask_10/ShapeShape$transform/transform/StringToNumber_2*
T0*
_output_shapes
:

7transform/transform/boolean_mask_10/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_10/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_10/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_10/strided_sliceStridedSlice)transform/transform/boolean_mask_10/Shape7transform/transform/boolean_mask_10/strided_slice/stack9transform/transform/boolean_mask_10/strided_slice/stack_19transform/transform/boolean_mask_10/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_10/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_10/ProdProd1transform/transform/boolean_mask_10/strided_slice:transform/transform/boolean_mask_10/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_10/Shape_1Shape$transform/transform/StringToNumber_2*
T0*
_output_shapes
:

9transform/transform/boolean_mask_10/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_10/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_10/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_10/strided_slice_1StridedSlice+transform/transform/boolean_mask_10/Shape_19transform/transform/boolean_mask_10/strided_slice_1/stack;transform/transform/boolean_mask_10/strided_slice_1/stack_1;transform/transform/boolean_mask_10/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_10/Shape_2Shape$transform/transform/StringToNumber_2*
T0*
_output_shapes
:

9transform/transform/boolean_mask_10/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_10/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_10/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ε
3transform/transform/boolean_mask_10/strided_slice_2StridedSlice+transform/transform/boolean_mask_10/Shape_29transform/transform/boolean_mask_10/strided_slice_2/stack;transform/transform/boolean_mask_10/strided_slice_2/stack_1;transform/transform/boolean_mask_10/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

3transform/transform/boolean_mask_10/concat/values_1Pack(transform/transform/boolean_mask_10/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_10/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_10/concatConcatV23transform/transform/boolean_mask_10/strided_slice_13transform/transform/boolean_mask_10/concat/values_13transform/transform/boolean_mask_10/strided_slice_2/transform/transform/boolean_mask_10/concat/axis*
N*
T0*
_output_shapes
:
Ά
+transform/transform/boolean_mask_10/ReshapeReshape$transform/transform/StringToNumber_2*transform/transform/boolean_mask_10/concat*
T0*#
_output_shapes
:?????????

3transform/transform/boolean_mask_10/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_10/Reshape_1Reshape"transform/transform/GreaterEqual_53transform/transform/boolean_mask_10/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_10/WhereWhere-transform/transform/boolean_mask_10/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_10/SqueezeSqueeze)transform/transform/boolean_mask_10/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_10/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_10/GatherV2GatherV2+transform/transform/boolean_mask_10/Reshape+transform/transform/boolean_mask_10/Squeeze1transform/transform/boolean_mask_10/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_5AddV2,transform/transform/boolean_mask_10/GatherV2transform/transform/add_5/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_5Logtransform/transform/add_5*
T0*#
_output_shapes
:?????????
§
)transform/transform/boolean_mask_11/ShapeShapeNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy*
T0	*
_output_shapes
:

7transform/transform/boolean_mask_11/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_11/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_11/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_11/strided_sliceStridedSlice)transform/transform/boolean_mask_11/Shape7transform/transform/boolean_mask_11/strided_slice/stack9transform/transform/boolean_mask_11/strided_slice/stack_19transform/transform/boolean_mask_11/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_11/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_11/ProdProd1transform/transform/boolean_mask_11/strided_slice:transform/transform/boolean_mask_11/Prod/reduction_indices*
T0*
_output_shapes
: 
©
+transform/transform/boolean_mask_11/Shape_1ShapeNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_11/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_11/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_11/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_11/strided_slice_1StridedSlice+transform/transform/boolean_mask_11/Shape_19transform/transform/boolean_mask_11/strided_slice_1/stack;transform/transform/boolean_mask_11/strided_slice_1/stack_1;transform/transform/boolean_mask_11/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
©
+transform/transform/boolean_mask_11/Shape_2ShapeNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_11/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_11/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_11/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_11/strided_slice_2StridedSlice+transform/transform/boolean_mask_11/Shape_29transform/transform/boolean_mask_11/strided_slice_2/stack;transform/transform/boolean_mask_11/strided_slice_2/stack_1;transform/transform/boolean_mask_11/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

3transform/transform/boolean_mask_11/concat/values_1Pack(transform/transform/boolean_mask_11/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_11/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_11/concatConcatV23transform/transform/boolean_mask_11/strided_slice_13transform/transform/boolean_mask_11/concat/values_13transform/transform/boolean_mask_11/strided_slice_2/transform/transform/boolean_mask_11/concat/axis*
N*
T0*
_output_shapes
:
δ
+transform/transform/boolean_mask_11/ReshapeReshapeNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy*transform/transform/boolean_mask_11/concat*
T0	*'
_output_shapes
:?????????

3transform/transform/boolean_mask_11/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_11/Reshape_1Reshape"transform/transform/GreaterEqual_53transform/transform/boolean_mask_11/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_11/WhereWhere-transform/transform/boolean_mask_11/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_11/SqueezeSqueeze)transform/transform/boolean_mask_11/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_11/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_11/GatherV2GatherV2+transform/transform/boolean_mask_11/Reshape+transform/transform/boolean_mask_11/Squeeze1transform/transform/boolean_mask_11/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_6GreaterEqual$transform/transform/StringToNumber_7$transform/transform/GreaterEqual_6/y*
T0*#
_output_shapes
:?????????
}
)transform/transform/boolean_mask_12/ShapeShape$transform/transform/StringToNumber_7*
T0*
_output_shapes
:

7transform/transform/boolean_mask_12/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_12/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_12/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_12/strided_sliceStridedSlice)transform/transform/boolean_mask_12/Shape7transform/transform/boolean_mask_12/strided_slice/stack9transform/transform/boolean_mask_12/strided_slice/stack_19transform/transform/boolean_mask_12/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_12/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_12/ProdProd1transform/transform/boolean_mask_12/strided_slice:transform/transform/boolean_mask_12/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_12/Shape_1Shape$transform/transform/StringToNumber_7*
T0*
_output_shapes
:

9transform/transform/boolean_mask_12/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_12/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_12/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_12/strided_slice_1StridedSlice+transform/transform/boolean_mask_12/Shape_19transform/transform/boolean_mask_12/strided_slice_1/stack;transform/transform/boolean_mask_12/strided_slice_1/stack_1;transform/transform/boolean_mask_12/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_12/Shape_2Shape$transform/transform/StringToNumber_7*
T0*
_output_shapes
:

9transform/transform/boolean_mask_12/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_12/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_12/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ε
3transform/transform/boolean_mask_12/strided_slice_2StridedSlice+transform/transform/boolean_mask_12/Shape_29transform/transform/boolean_mask_12/strided_slice_2/stack;transform/transform/boolean_mask_12/strided_slice_2/stack_1;transform/transform/boolean_mask_12/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

3transform/transform/boolean_mask_12/concat/values_1Pack(transform/transform/boolean_mask_12/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_12/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_12/concatConcatV23transform/transform/boolean_mask_12/strided_slice_13transform/transform/boolean_mask_12/concat/values_13transform/transform/boolean_mask_12/strided_slice_2/transform/transform/boolean_mask_12/concat/axis*
N*
T0*
_output_shapes
:
Ά
+transform/transform/boolean_mask_12/ReshapeReshape$transform/transform/StringToNumber_7*transform/transform/boolean_mask_12/concat*
T0*#
_output_shapes
:?????????

3transform/transform/boolean_mask_12/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_12/Reshape_1Reshape"transform/transform/GreaterEqual_63transform/transform/boolean_mask_12/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_12/WhereWhere-transform/transform/boolean_mask_12/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_12/SqueezeSqueeze)transform/transform/boolean_mask_12/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_12/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_12/GatherV2GatherV2+transform/transform/boolean_mask_12/Reshape+transform/transform/boolean_mask_12/Squeeze1transform/transform/boolean_mask_12/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_6/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_6AddV2,transform/transform/boolean_mask_12/GatherV2transform/transform/add_6/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_6Logtransform/transform/add_6*
T0*#
_output_shapes
:?????????

)transform/transform/boolean_mask_13/ShapeShapeFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy*
T0	*
_output_shapes
:

7transform/transform/boolean_mask_13/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_13/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_13/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_13/strided_sliceStridedSlice)transform/transform/boolean_mask_13/Shape7transform/transform/boolean_mask_13/strided_slice/stack9transform/transform/boolean_mask_13/strided_slice/stack_19transform/transform/boolean_mask_13/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_13/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_13/ProdProd1transform/transform/boolean_mask_13/strided_slice:transform/transform/boolean_mask_13/Prod/reduction_indices*
T0*
_output_shapes
: 
‘
+transform/transform/boolean_mask_13/Shape_1ShapeFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_13/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_13/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_13/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_13/strided_slice_1StridedSlice+transform/transform/boolean_mask_13/Shape_19transform/transform/boolean_mask_13/strided_slice_1/stack;transform/transform/boolean_mask_13/strided_slice_1/stack_1;transform/transform/boolean_mask_13/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
‘
+transform/transform/boolean_mask_13/Shape_2ShapeFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_13/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_13/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_13/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_13/strided_slice_2StridedSlice+transform/transform/boolean_mask_13/Shape_29transform/transform/boolean_mask_13/strided_slice_2/stack;transform/transform/boolean_mask_13/strided_slice_2/stack_1;transform/transform/boolean_mask_13/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

3transform/transform/boolean_mask_13/concat/values_1Pack(transform/transform/boolean_mask_13/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_13/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_13/concatConcatV23transform/transform/boolean_mask_13/strided_slice_13transform/transform/boolean_mask_13/concat/values_13transform/transform/boolean_mask_13/strided_slice_2/transform/transform/boolean_mask_13/concat/axis*
N*
T0*
_output_shapes
:
ά
+transform/transform/boolean_mask_13/ReshapeReshapeFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy*transform/transform/boolean_mask_13/concat*
T0	*'
_output_shapes
:?????????

3transform/transform/boolean_mask_13/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_13/Reshape_1Reshape"transform/transform/GreaterEqual_63transform/transform/boolean_mask_13/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_13/WhereWhere-transform/transform/boolean_mask_13/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_13/SqueezeSqueeze)transform/transform/boolean_mask_13/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_13/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_13/GatherV2GatherV2+transform/transform/boolean_mask_13/Reshape+transform/transform/boolean_mask_13/Squeeze1transform/transform/boolean_mask_13/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_7GreaterEqual$transform/transform/StringToNumber_9$transform/transform/GreaterEqual_7/y*
T0*#
_output_shapes
:?????????
}
)transform/transform/boolean_mask_14/ShapeShape$transform/transform/StringToNumber_9*
T0*
_output_shapes
:

7transform/transform/boolean_mask_14/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_14/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_14/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_14/strided_sliceStridedSlice)transform/transform/boolean_mask_14/Shape7transform/transform/boolean_mask_14/strided_slice/stack9transform/transform/boolean_mask_14/strided_slice/stack_19transform/transform/boolean_mask_14/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_14/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_14/ProdProd1transform/transform/boolean_mask_14/strided_slice:transform/transform/boolean_mask_14/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_14/Shape_1Shape$transform/transform/StringToNumber_9*
T0*
_output_shapes
:

9transform/transform/boolean_mask_14/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_14/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_14/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_14/strided_slice_1StridedSlice+transform/transform/boolean_mask_14/Shape_19transform/transform/boolean_mask_14/strided_slice_1/stack;transform/transform/boolean_mask_14/strided_slice_1/stack_1;transform/transform/boolean_mask_14/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_14/Shape_2Shape$transform/transform/StringToNumber_9*
T0*
_output_shapes
:

9transform/transform/boolean_mask_14/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_14/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_14/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ε
3transform/transform/boolean_mask_14/strided_slice_2StridedSlice+transform/transform/boolean_mask_14/Shape_29transform/transform/boolean_mask_14/strided_slice_2/stack;transform/transform/boolean_mask_14/strided_slice_2/stack_1;transform/transform/boolean_mask_14/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

3transform/transform/boolean_mask_14/concat/values_1Pack(transform/transform/boolean_mask_14/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_14/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_14/concatConcatV23transform/transform/boolean_mask_14/strided_slice_13transform/transform/boolean_mask_14/concat/values_13transform/transform/boolean_mask_14/strided_slice_2/transform/transform/boolean_mask_14/concat/axis*
N*
T0*
_output_shapes
:
Ά
+transform/transform/boolean_mask_14/ReshapeReshape$transform/transform/StringToNumber_9*transform/transform/boolean_mask_14/concat*
T0*#
_output_shapes
:?????????

3transform/transform/boolean_mask_14/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_14/Reshape_1Reshape"transform/transform/GreaterEqual_73transform/transform/boolean_mask_14/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_14/WhereWhere-transform/transform/boolean_mask_14/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_14/SqueezeSqueeze)transform/transform/boolean_mask_14/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_14/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_14/GatherV2GatherV2+transform/transform/boolean_mask_14/Reshape+transform/transform/boolean_mask_14/Squeeze1transform/transform/boolean_mask_14/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_7/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_7AddV2,transform/transform/boolean_mask_14/GatherV2transform/transform/add_7/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_7Logtransform/transform/add_7*
T0*#
_output_shapes
:?????????

)transform/transform/boolean_mask_15/ShapeShape4transform/transform/inputs/inputs/pixels/pixels_copy*
T0	*
_output_shapes
:

7transform/transform/boolean_mask_15/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_15/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_15/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_15/strided_sliceStridedSlice)transform/transform/boolean_mask_15/Shape7transform/transform/boolean_mask_15/strided_slice/stack9transform/transform/boolean_mask_15/strided_slice/stack_19transform/transform/boolean_mask_15/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_15/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_15/ProdProd1transform/transform/boolean_mask_15/strided_slice:transform/transform/boolean_mask_15/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_15/Shape_1Shape4transform/transform/inputs/inputs/pixels/pixels_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_15/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_15/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_15/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_15/strided_slice_1StridedSlice+transform/transform/boolean_mask_15/Shape_19transform/transform/boolean_mask_15/strided_slice_1/stack;transform/transform/boolean_mask_15/strided_slice_1/stack_1;transform/transform/boolean_mask_15/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_15/Shape_2Shape4transform/transform/inputs/inputs/pixels/pixels_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_15/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_15/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_15/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_15/strided_slice_2StridedSlice+transform/transform/boolean_mask_15/Shape_29transform/transform/boolean_mask_15/strided_slice_2/stack;transform/transform/boolean_mask_15/strided_slice_2/stack_1;transform/transform/boolean_mask_15/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

3transform/transform/boolean_mask_15/concat/values_1Pack(transform/transform/boolean_mask_15/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_15/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_15/concatConcatV23transform/transform/boolean_mask_15/strided_slice_13transform/transform/boolean_mask_15/concat/values_13transform/transform/boolean_mask_15/strided_slice_2/transform/transform/boolean_mask_15/concat/axis*
N*
T0*
_output_shapes
:
Κ
+transform/transform/boolean_mask_15/ReshapeReshape4transform/transform/inputs/inputs/pixels/pixels_copy*transform/transform/boolean_mask_15/concat*
T0	*'
_output_shapes
:?????????

3transform/transform/boolean_mask_15/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_15/Reshape_1Reshape"transform/transform/GreaterEqual_73transform/transform/boolean_mask_15/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_15/WhereWhere-transform/transform/boolean_mask_15/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_15/SqueezeSqueeze)transform/transform/boolean_mask_15/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_15/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_15/GatherV2GatherV2+transform/transform/boolean_mask_15/Reshape+transform/transform/boolean_mask_15/Squeeze1transform/transform/boolean_mask_15/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_8/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
¬
"transform/transform/GreaterEqual_8GreaterEqual$transform/transform/StringToNumber_8$transform/transform/GreaterEqual_8/y*
T0*#
_output_shapes
:?????????
}
)transform/transform/boolean_mask_16/ShapeShape$transform/transform/StringToNumber_8*
T0*
_output_shapes
:

7transform/transform/boolean_mask_16/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_16/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_16/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_16/strided_sliceStridedSlice)transform/transform/boolean_mask_16/Shape7transform/transform/boolean_mask_16/strided_slice/stack9transform/transform/boolean_mask_16/strided_slice/stack_19transform/transform/boolean_mask_16/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_16/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_16/ProdProd1transform/transform/boolean_mask_16/strided_slice:transform/transform/boolean_mask_16/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_16/Shape_1Shape$transform/transform/StringToNumber_8*
T0*
_output_shapes
:

9transform/transform/boolean_mask_16/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_16/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_16/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_16/strided_slice_1StridedSlice+transform/transform/boolean_mask_16/Shape_19transform/transform/boolean_mask_16/strided_slice_1/stack;transform/transform/boolean_mask_16/strided_slice_1/stack_1;transform/transform/boolean_mask_16/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_16/Shape_2Shape$transform/transform/StringToNumber_8*
T0*
_output_shapes
:

9transform/transform/boolean_mask_16/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_16/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_16/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ε
3transform/transform/boolean_mask_16/strided_slice_2StridedSlice+transform/transform/boolean_mask_16/Shape_29transform/transform/boolean_mask_16/strided_slice_2/stack;transform/transform/boolean_mask_16/strided_slice_2/stack_1;transform/transform/boolean_mask_16/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

3transform/transform/boolean_mask_16/concat/values_1Pack(transform/transform/boolean_mask_16/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_16/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_16/concatConcatV23transform/transform/boolean_mask_16/strided_slice_13transform/transform/boolean_mask_16/concat/values_13transform/transform/boolean_mask_16/strided_slice_2/transform/transform/boolean_mask_16/concat/axis*
N*
T0*
_output_shapes
:
Ά
+transform/transform/boolean_mask_16/ReshapeReshape$transform/transform/StringToNumber_8*transform/transform/boolean_mask_16/concat*
T0*#
_output_shapes
:?????????

3transform/transform/boolean_mask_16/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_16/Reshape_1Reshape"transform/transform/GreaterEqual_83transform/transform/boolean_mask_16/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_16/WhereWhere-transform/transform/boolean_mask_16/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_16/SqueezeSqueeze)transform/transform/boolean_mask_16/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_16/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_16/GatherV2GatherV2+transform/transform/boolean_mask_16/Reshape+transform/transform/boolean_mask_16/Squeeze1transform/transform/boolean_mask_16/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_8/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_8AddV2,transform/transform/boolean_mask_16/GatherV2transform/transform/add_8/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_8Logtransform/transform/add_8*
T0*#
_output_shapes
:?????????

)transform/transform/boolean_mask_17/ShapeShapeFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy*
T0	*
_output_shapes
:

7transform/transform/boolean_mask_17/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_17/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_17/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_17/strided_sliceStridedSlice)transform/transform/boolean_mask_17/Shape7transform/transform/boolean_mask_17/strided_slice/stack9transform/transform/boolean_mask_17/strided_slice/stack_19transform/transform/boolean_mask_17/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_17/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_17/ProdProd1transform/transform/boolean_mask_17/strided_slice:transform/transform/boolean_mask_17/Prod/reduction_indices*
T0*
_output_shapes
: 
‘
+transform/transform/boolean_mask_17/Shape_1ShapeFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_17/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_17/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_17/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_17/strided_slice_1StridedSlice+transform/transform/boolean_mask_17/Shape_19transform/transform/boolean_mask_17/strided_slice_1/stack;transform/transform/boolean_mask_17/strided_slice_1/stack_1;transform/transform/boolean_mask_17/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
‘
+transform/transform/boolean_mask_17/Shape_2ShapeFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_17/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_17/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_17/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_17/strided_slice_2StridedSlice+transform/transform/boolean_mask_17/Shape_29transform/transform/boolean_mask_17/strided_slice_2/stack;transform/transform/boolean_mask_17/strided_slice_2/stack_1;transform/transform/boolean_mask_17/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

3transform/transform/boolean_mask_17/concat/values_1Pack(transform/transform/boolean_mask_17/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_17/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_17/concatConcatV23transform/transform/boolean_mask_17/strided_slice_13transform/transform/boolean_mask_17/concat/values_13transform/transform/boolean_mask_17/strided_slice_2/transform/transform/boolean_mask_17/concat/axis*
N*
T0*
_output_shapes
:
ά
+transform/transform/boolean_mask_17/ReshapeReshapeFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy*transform/transform/boolean_mask_17/concat*
T0	*'
_output_shapes
:?????????

3transform/transform/boolean_mask_17/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_17/Reshape_1Reshape"transform/transform/GreaterEqual_83transform/transform/boolean_mask_17/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_17/WhereWhere-transform/transform/boolean_mask_17/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_17/SqueezeSqueeze)transform/transform/boolean_mask_17/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_17/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_17/GatherV2GatherV2+transform/transform/boolean_mask_17/Reshape+transform/transform/boolean_mask_17/Squeeze1transform/transform/boolean_mask_17/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
i
$transform/transform/GreaterEqual_9/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
ͺ
"transform/transform/GreaterEqual_9GreaterEqual"transform/transform/StringToNumber$transform/transform/GreaterEqual_9/y*
T0*#
_output_shapes
:?????????
{
)transform/transform/boolean_mask_18/ShapeShape"transform/transform/StringToNumber*
T0*
_output_shapes
:

7transform/transform/boolean_mask_18/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_18/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_18/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_18/strided_sliceStridedSlice)transform/transform/boolean_mask_18/Shape7transform/transform/boolean_mask_18/strided_slice/stack9transform/transform/boolean_mask_18/strided_slice/stack_19transform/transform/boolean_mask_18/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_18/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_18/ProdProd1transform/transform/boolean_mask_18/strided_slice:transform/transform/boolean_mask_18/Prod/reduction_indices*
T0*
_output_shapes
: 
}
+transform/transform/boolean_mask_18/Shape_1Shape"transform/transform/StringToNumber*
T0*
_output_shapes
:

9transform/transform/boolean_mask_18/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_18/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_18/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_18/strided_slice_1StridedSlice+transform/transform/boolean_mask_18/Shape_19transform/transform/boolean_mask_18/strided_slice_1/stack;transform/transform/boolean_mask_18/strided_slice_1/stack_1;transform/transform/boolean_mask_18/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask
}
+transform/transform/boolean_mask_18/Shape_2Shape"transform/transform/StringToNumber*
T0*
_output_shapes
:

9transform/transform/boolean_mask_18/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_18/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_18/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ε
3transform/transform/boolean_mask_18/strided_slice_2StridedSlice+transform/transform/boolean_mask_18/Shape_29transform/transform/boolean_mask_18/strided_slice_2/stack;transform/transform/boolean_mask_18/strided_slice_2/stack_1;transform/transform/boolean_mask_18/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
end_mask

3transform/transform/boolean_mask_18/concat/values_1Pack(transform/transform/boolean_mask_18/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_18/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_18/concatConcatV23transform/transform/boolean_mask_18/strided_slice_13transform/transform/boolean_mask_18/concat/values_13transform/transform/boolean_mask_18/strided_slice_2/transform/transform/boolean_mask_18/concat/axis*
N*
T0*
_output_shapes
:
΄
+transform/transform/boolean_mask_18/ReshapeReshape"transform/transform/StringToNumber*transform/transform/boolean_mask_18/concat*
T0*#
_output_shapes
:?????????

3transform/transform/boolean_mask_18/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_18/Reshape_1Reshape"transform/transform/GreaterEqual_93transform/transform/boolean_mask_18/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_18/WhereWhere-transform/transform/boolean_mask_18/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_18/SqueezeSqueeze)transform/transform/boolean_mask_18/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_18/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_18/GatherV2GatherV2+transform/transform/boolean_mask_18/Reshape+transform/transform/boolean_mask_18/Squeeze1transform/transform/boolean_mask_18/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
`
transform/transform/add_9/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?

transform/transform/add_9AddV2,transform/transform/boolean_mask_18/GatherV2transform/transform/add_9/y*
T0*#
_output_shapes
:?????????
i
transform/transform/Log_9Logtransform/transform/add_9*
T0*#
_output_shapes
:?????????

)transform/transform/boolean_mask_19/ShapeShape2transform/transform/inputs/inputs/cores/cores_copy*
T0	*
_output_shapes
:

7transform/transform/boolean_mask_19/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9transform/transform/boolean_mask_19/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9transform/transform/boolean_mask_19/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ν
1transform/transform/boolean_mask_19/strided_sliceStridedSlice)transform/transform/boolean_mask_19/Shape7transform/transform/boolean_mask_19/strided_slice/stack9transform/transform/boolean_mask_19/strided_slice/stack_19transform/transform/boolean_mask_19/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:

:transform/transform/boolean_mask_19/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
ΐ
(transform/transform/boolean_mask_19/ProdProd1transform/transform/boolean_mask_19/strided_slice:transform/transform/boolean_mask_19/Prod/reduction_indices*
T0*
_output_shapes
: 

+transform/transform/boolean_mask_19/Shape_1Shape2transform/transform/inputs/inputs/cores/cores_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_19/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_19/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_19/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_19/strided_slice_1StridedSlice+transform/transform/boolean_mask_19/Shape_19transform/transform/boolean_mask_19/strided_slice_1/stack;transform/transform/boolean_mask_19/strided_slice_1/stack_1;transform/transform/boolean_mask_19/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *

begin_mask

+transform/transform/boolean_mask_19/Shape_2Shape2transform/transform/inputs/inputs/cores/cores_copy*
T0	*
_output_shapes
:

9transform/transform/boolean_mask_19/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:

;transform/transform/boolean_mask_19/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

;transform/transform/boolean_mask_19/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
η
3transform/transform/boolean_mask_19/strided_slice_2StridedSlice+transform/transform/boolean_mask_19/Shape_29transform/transform/boolean_mask_19/strided_slice_2/stack;transform/transform/boolean_mask_19/strided_slice_2/stack_1;transform/transform/boolean_mask_19/strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

3transform/transform/boolean_mask_19/concat/values_1Pack(transform/transform/boolean_mask_19/Prod*
N*
T0*
_output_shapes
:
q
/transform/transform/boolean_mask_19/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
΄
*transform/transform/boolean_mask_19/concatConcatV23transform/transform/boolean_mask_19/strided_slice_13transform/transform/boolean_mask_19/concat/values_13transform/transform/boolean_mask_19/strided_slice_2/transform/transform/boolean_mask_19/concat/axis*
N*
T0*
_output_shapes
:
Θ
+transform/transform/boolean_mask_19/ReshapeReshape2transform/transform/inputs/inputs/cores/cores_copy*transform/transform/boolean_mask_19/concat*
T0	*'
_output_shapes
:?????????

3transform/transform/boolean_mask_19/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Ώ
-transform/transform/boolean_mask_19/Reshape_1Reshape"transform/transform/GreaterEqual_93transform/transform/boolean_mask_19/Reshape_1/shape*
T0
*#
_output_shapes
:?????????

)transform/transform/boolean_mask_19/WhereWhere-transform/transform/boolean_mask_19/Reshape_1*'
_output_shapes
:?????????
¦
+transform/transform/boolean_mask_19/SqueezeSqueeze)transform/transform/boolean_mask_19/Where*
T0	*#
_output_shapes
:?????????*
squeeze_dims

s
1transform/transform/boolean_mask_19/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

,transform/transform/boolean_mask_19/GatherV2GatherV2+transform/transform/boolean_mask_19/Reshape+transform/transform/boolean_mask_19/Squeeze1transform/transform/boolean_mask_19/GatherV2/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
q
'transform/transform/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
s
)transform/transform/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
s
)transform/transform/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
²
!transform/transform/strided_sliceStridedSlice:transform/transform/inputs/inputs/duration/duration_2_copy'transform/transform/strided_slice/stack)transform/transform/strided_slice/stack_1)transform/transform/strided_slice/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_31/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
»
/transform/transform/SparseTensor_31/dense_shapePack!transform/transform/strided_slice1transform/transform/SparseTensor_31/dense_shape/1*
N*
T0	*
_output_shapes
:
t
/transform/transform/sp2d-duration/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ά
!transform/transform/sp2d-durationSparseToDense8transform/transform/inputs/inputs/duration/duration_copy/transform/transform/SparseTensor_31/dense_shape$transform/transform/StringToNumber_4/transform/transform/sp2d-duration/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
x
$transform/transform/zeros_like/ShapeShape$transform/transform/StringToNumber_4*
T0*
_output_shapes
:
f
$transform/transform/zeros_like/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
 
transform/transform/zeros_likeFill$transform/transform/zeros_like/Shape$transform/transform/zeros_like/Const*
T0	*#
_output_shapes
:?????????
s
)transform/transform/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
#transform/transform/strided_slice_1StridedSlice:transform/transform/inputs/inputs/duration/duration_2_copy)transform/transform/strided_slice_1/stack+transform/transform/strided_slice_1/stack_1+transform/transform/strided_slice_1/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_33/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_33/dense_shapePack#transform/transform/strided_slice_11transform/transform/SparseTensor_33/dense_shape/1*
N*
T0	*
_output_shapes
:
y
7transform/transform/sp2d-duration_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
ΐ
)transform/transform/sp2d-duration_missingSparseToDense8transform/transform/inputs/inputs/duration/duration_copy/transform/transform/SparseTensor_33/dense_shapetransform/transform/zeros_like7transform/transform/sp2d-duration_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/CastCast)transform/transform/sp2d-duration_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
s
)transform/transform/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
#transform/transform/strided_slice_2StridedSlice:transform/transform/inputs/inputs/duration/duration_2_copy)transform/transform/strided_slice_2/stack+transform/transform/strided_slice_2/stack_1+transform/transform/strided_slice_2/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_34/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_34/dense_shapePack#transform/transform/strided_slice_21transform/transform/SparseTensor_34/dense_shape/1*
N*
T0	*
_output_shapes
:

?transform/transform/sp2d-duration-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ό
1transform/transform/sp2d-duration-log-transformedSparseToDense+transform/transform/boolean_mask_1/GatherV2/transform/transform/SparseTensor_34/dense_shapetransform/transform/Log?transform/transform/sp2d-duration-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
m
&transform/transform/zeros_like_1/ShapeShapetransform/transform/Log*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_1Fill&transform/transform/zeros_like_1/Shape&transform/transform/zeros_like_1/Const*
T0	*#
_output_shapes
:?????????
s
)transform/transform/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
#transform/transform/strided_slice_3StridedSlice:transform/transform/inputs/inputs/duration/duration_2_copy)transform/transform/strided_slice_3/stack+transform/transform/strided_slice_3/stack_1+transform/transform/strided_slice_3/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_36/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_36/dense_shapePack#transform/transform/strided_slice_31transform/transform/SparseTensor_36/dense_shape/1*
N*
T0	*
_output_shapes
:

Gtransform/transform/sp2d-duration-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Υ
9transform/transform/sp2d-duration-log-transformed_missingSparseToDense+transform/transform/boolean_mask_1/GatherV2/transform/transform/SparseTensor_36/dense_shape transform/transform/zeros_like_1Gtransform/transform/sp2d-duration-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_1Cast9transform/transform/sp2d-duration-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
s
)transform/transform/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
°
#transform/transform/strided_slice_4StridedSlice0transform/transform/inputs/inputs/fps/fps_2_copy)transform/transform/strided_slice_4/stack+transform/transform/strided_slice_4/stack_1+transform/transform/strided_slice_4/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_37/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_37/dense_shapePack#transform/transform/strided_slice_41transform/transform/SparseTensor_37/dense_shape/1*
N*
T0	*
_output_shapes
:
o
*transform/transform/sp2d-fps/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
’
transform/transform/sp2d-fpsSparseToDense.transform/transform/inputs/inputs/fps/fps_copy/transform/transform/SparseTensor_37/dense_shape$transform/transform/StringToNumber_5*transform/transform/sp2d-fps/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
z
&transform/transform/zeros_like_2/ShapeShape$transform/transform/StringToNumber_5*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_2/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_2Fill&transform/transform/zeros_like_2/Shape&transform/transform/zeros_like_2/Const*
T0	*#
_output_shapes
:?????????
s
)transform/transform/strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
°
#transform/transform/strided_slice_5StridedSlice0transform/transform/inputs/inputs/fps/fps_2_copy)transform/transform/strided_slice_5/stack+transform/transform/strided_slice_5/stack_1+transform/transform/strided_slice_5/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_39/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_39/dense_shapePack#transform/transform/strided_slice_51transform/transform/SparseTensor_39/dense_shape/1*
N*
T0	*
_output_shapes
:
t
2transform/transform/sp2d-fps_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
?
$transform/transform/sp2d-fps_missingSparseToDense.transform/transform/inputs/inputs/fps/fps_copy/transform/transform/SparseTensor_39/dense_shape transform/transform/zeros_like_22transform/transform/sp2d-fps_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_2Cast$transform/transform/sp2d-fps_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
s
)transform/transform/strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
°
#transform/transform/strided_slice_6StridedSlice0transform/transform/inputs/inputs/fps/fps_2_copy)transform/transform/strided_slice_6/stack+transform/transform/strided_slice_6/stack_1+transform/transform/strided_slice_6/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_40/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_40/dense_shapePack#transform/transform/strided_slice_61transform/transform/SparseTensor_40/dense_shape/1*
N*
T0	*
_output_shapes
:

:transform/transform/sp2d-fps-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
΄
,transform/transform/sp2d-fps-log-transformedSparseToDense+transform/transform/boolean_mask_3/GatherV2/transform/transform/SparseTensor_40/dense_shapetransform/transform/Log_1:transform/transform/sp2d-fps-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
o
&transform/transform/zeros_like_3/ShapeShapetransform/transform/Log_1*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_3/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_3Fill&transform/transform/zeros_like_3/Shape&transform/transform/zeros_like_3/Const*
T0	*#
_output_shapes
:?????????
s
)transform/transform/strided_slice_7/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_7/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_7/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
°
#transform/transform/strided_slice_7StridedSlice0transform/transform/inputs/inputs/fps/fps_2_copy)transform/transform/strided_slice_7/stack+transform/transform/strided_slice_7/stack_1+transform/transform/strided_slice_7/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_42/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_42/dense_shapePack#transform/transform/strided_slice_71transform/transform/SparseTensor_42/dense_shape/1*
N*
T0	*
_output_shapes
:

Btransform/transform/sp2d-fps-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Λ
4transform/transform/sp2d-fps-log-transformed_missingSparseToDense+transform/transform/boolean_mask_3/GatherV2/transform/transform/SparseTensor_42/dense_shape transform/transform/zeros_like_3Btransform/transform/sp2d-fps-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_3Cast4transform/transform/sp2d-fps-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
s
)transform/transform/strided_slice_8/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_8/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_8/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
#transform/transform/strided_slice_8StridedSliceRtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2_copy)transform/transform/strided_slice_8/stack+transform/transform/strided_slice_8/stack_1+transform/transform/strided_slice_8/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_43/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_43/dense_shapePack#transform/transform/strided_slice_81transform/transform/SparseTensor_43/dense_shape/1*
N*
T0	*
_output_shapes
:
~
9transform/transform/sp2d-downscaled_bitrate/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
β
+transform/transform/sp2d-downscaled_bitrateSparseToDensePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy/transform/transform/SparseTensor_43/dense_shape$transform/transform/StringToNumber_39transform/transform/sp2d-downscaled_bitrate/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
z
&transform/transform/zeros_like_4/ShapeShape$transform/transform/StringToNumber_3*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_4/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_4Fill&transform/transform/zeros_like_4/Shape&transform/transform/zeros_like_4/Const*
T0	*#
_output_shapes
:?????????
s
)transform/transform/strided_slice_9/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+transform/transform/strided_slice_9/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+transform/transform/strided_slice_9/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
#transform/transform/strided_slice_9StridedSliceRtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2_copy)transform/transform/strided_slice_9/stack+transform/transform/strided_slice_9/stack_1+transform/transform/strided_slice_9/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_45/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
½
/transform/transform/SparseTensor_45/dense_shapePack#transform/transform/strided_slice_91transform/transform/SparseTensor_45/dense_shape/1*
N*
T0	*
_output_shapes
:

Atransform/transform/sp2d-downscaled_bitrate_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
ξ
3transform/transform/sp2d-downscaled_bitrate_missingSparseToDensePtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_copy/transform/transform/SparseTensor_45/dense_shape transform/transform/zeros_like_4Atransform/transform/sp2d-downscaled_bitrate_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_4Cast3transform/transform/sp2d-downscaled_bitrate_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_10/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_10/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_10/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Φ
$transform/transform/strided_slice_10StridedSliceRtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2_copy*transform/transform/strided_slice_10/stack,transform/transform/strided_slice_10/stack_1,transform/transform/strided_slice_10/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_46/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_46/dense_shapePack$transform/transform/strided_slice_101transform/transform/SparseTensor_46/dense_shape/1*
N*
T0	*
_output_shapes
:

Itransform/transform/sp2d-downscaled_bitrate-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
?
;transform/transform/sp2d-downscaled_bitrate-log-transformedSparseToDense+transform/transform/boolean_mask_5/GatherV2/transform/transform/SparseTensor_46/dense_shapetransform/transform/Log_2Itransform/transform/sp2d-downscaled_bitrate-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
o
&transform/transform/zeros_like_5/ShapeShapetransform/transform/Log_2*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_5/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_5Fill&transform/transform/zeros_like_5/Shape&transform/transform/zeros_like_5/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_11/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_11/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_11/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Φ
$transform/transform/strided_slice_11StridedSliceRtransform/transform/inputs/inputs/F_downscaled_bitrate/F_downscaled_bitrate_2_copy*transform/transform/strided_slice_11/stack,transform/transform/strided_slice_11/stack_1,transform/transform/strided_slice_11/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_48/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_48/dense_shapePack$transform/transform/strided_slice_111transform/transform/SparseTensor_48/dense_shape/1*
N*
T0	*
_output_shapes
:

Qtransform/transform/sp2d-downscaled_bitrate-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
ι
Ctransform/transform/sp2d-downscaled_bitrate-log-transformed_missingSparseToDense+transform/transform/boolean_mask_5/GatherV2/transform/transform/SparseTensor_48/dense_shape transform/transform/zeros_like_5Qtransform/transform/sp2d-downscaled_bitrate-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????
¨
transform/transform/Cast_5CastCtransform/transform/sp2d-downscaled_bitrate-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_12/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_12/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_12/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_12StridedSlice6transform/transform/inputs/inputs/height/height_2_copy*transform/transform/strided_slice_12/stack,transform/transform/strided_slice_12/stack_1,transform/transform/strided_slice_12/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_49/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_49/dense_shapePack$transform/transform/strided_slice_121transform/transform/SparseTensor_49/dense_shape/1*
N*
T0	*
_output_shapes
:
r
-transform/transform/sp2d-height/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
?
transform/transform/sp2d-heightSparseToDense4transform/transform/inputs/inputs/height/height_copy/transform/transform/SparseTensor_49/dense_shape$transform/transform/StringToNumber_6-transform/transform/sp2d-height/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
z
&transform/transform/zeros_like_6/ShapeShape$transform/transform/StringToNumber_6*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_6/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_6Fill&transform/transform/zeros_like_6/Shape&transform/transform/zeros_like_6/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_13/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_13/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_13/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_13StridedSlice6transform/transform/inputs/inputs/height/height_2_copy*transform/transform/strided_slice_13/stack,transform/transform/strided_slice_13/stack_1,transform/transform/strided_slice_13/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_51/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_51/dense_shapePack$transform/transform/strided_slice_131transform/transform/SparseTensor_51/dense_shape/1*
N*
T0	*
_output_shapes
:
w
5transform/transform/sp2d-height_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Ί
'transform/transform/sp2d-height_missingSparseToDense4transform/transform/inputs/inputs/height/height_copy/transform/transform/SparseTensor_51/dense_shape transform/transform/zeros_like_65transform/transform/sp2d-height_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_6Cast'transform/transform/sp2d-height_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_14/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_14/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_14/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_14StridedSlice6transform/transform/inputs/inputs/height/height_2_copy*transform/transform/strided_slice_14/stack,transform/transform/strided_slice_14/stack_1,transform/transform/strided_slice_14/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_52/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_52/dense_shapePack$transform/transform/strided_slice_141transform/transform/SparseTensor_52/dense_shape/1*
N*
T0	*
_output_shapes
:

=transform/transform/sp2d-height-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ί
/transform/transform/sp2d-height-log-transformedSparseToDense+transform/transform/boolean_mask_7/GatherV2/transform/transform/SparseTensor_52/dense_shapetransform/transform/Log_3=transform/transform/sp2d-height-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
o
&transform/transform/zeros_like_7/ShapeShapetransform/transform/Log_3*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_7/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_7Fill&transform/transform/zeros_like_7/Shape&transform/transform/zeros_like_7/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_15/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_15/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_15/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_15StridedSlice6transform/transform/inputs/inputs/height/height_2_copy*transform/transform/strided_slice_15/stack,transform/transform/strided_slice_15/stack_1,transform/transform/strided_slice_15/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_54/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_54/dense_shapePack$transform/transform/strided_slice_151transform/transform/SparseTensor_54/dense_shape/1*
N*
T0	*
_output_shapes
:

Etransform/transform/sp2d-height-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Ρ
7transform/transform/sp2d-height-log-transformed_missingSparseToDense+transform/transform/boolean_mask_7/GatherV2/transform/transform/SparseTensor_54/dense_shape transform/transform/zeros_like_7Etransform/transform/sp2d-height-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_7Cast7transform/transform/sp2d-height-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_16/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_16/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_16/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_16StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2_copy*transform/transform/strided_slice_16/stack,transform/transform/strided_slice_16/stack_1,transform/transform/strided_slice_16/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_55/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_55/dense_shapePack$transform/transform/strided_slice_161transform/transform/SparseTensor_55/dense_shape/1*
N*
T0	*
_output_shapes
:
}
8transform/transform/sp2d-downscaled_avg_si/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
ή
*transform/transform/sp2d-downscaled_avg_siSparseToDenseNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy/transform/transform/SparseTensor_55/dense_shape$transform/transform/StringToNumber_18transform/transform/sp2d-downscaled_avg_si/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
z
&transform/transform/zeros_like_8/ShapeShape$transform/transform/StringToNumber_1*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_8/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_8Fill&transform/transform/zeros_like_8/Shape&transform/transform/zeros_like_8/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_17/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_17/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_17/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_17StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2_copy*transform/transform/strided_slice_17/stack,transform/transform/strided_slice_17/stack_1,transform/transform/strided_slice_17/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_57/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_57/dense_shapePack$transform/transform/strided_slice_171transform/transform/SparseTensor_57/dense_shape/1*
N*
T0	*
_output_shapes
:

@transform/transform/sp2d-downscaled_avg_si_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
κ
2transform/transform/sp2d-downscaled_avg_si_missingSparseToDenseNtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_copy/transform/transform/SparseTensor_57/dense_shape transform/transform/zeros_like_8@transform/transform/sp2d-downscaled_avg_si_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_8Cast2transform/transform/sp2d-downscaled_avg_si_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_18/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_18/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_18/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_18StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2_copy*transform/transform/strided_slice_18/stack,transform/transform/strided_slice_18/stack_1,transform/transform/strided_slice_18/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_58/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_58/dense_shapePack$transform/transform/strided_slice_181transform/transform/SparseTensor_58/dense_shape/1*
N*
T0	*
_output_shapes
:

Htransform/transform/sp2d-downscaled_avg_si-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Π
:transform/transform/sp2d-downscaled_avg_si-log-transformedSparseToDense+transform/transform/boolean_mask_9/GatherV2/transform/transform/SparseTensor_58/dense_shapetransform/transform/Log_4Htransform/transform/sp2d-downscaled_avg_si-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
o
&transform/transform/zeros_like_9/ShapeShapetransform/transform/Log_4*
T0*
_output_shapes
:
h
&transform/transform/zeros_like_9/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
¦
 transform/transform/zeros_like_9Fill&transform/transform/zeros_like_9/Shape&transform/transform/zeros_like_9/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_19/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_19/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_19/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_19StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_si/F_downscaled_avg_si_2_copy*transform/transform/strided_slice_19/stack,transform/transform/strided_slice_19/stack_1,transform/transform/strided_slice_19/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_60/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_60/dense_shapePack$transform/transform/strided_slice_191transform/transform/SparseTensor_60/dense_shape/1*
N*
T0	*
_output_shapes
:

Ptransform/transform/sp2d-downscaled_avg_si-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
η
Btransform/transform/sp2d-downscaled_avg_si-log-transformed_missingSparseToDense+transform/transform/boolean_mask_9/GatherV2/transform/transform/SparseTensor_60/dense_shape transform/transform/zeros_like_9Ptransform/transform/sp2d-downscaled_avg_si-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????
§
transform/transform/Cast_9CastBtransform/transform/sp2d-downscaled_avg_si-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_20/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_20/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_20/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_20StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2_copy*transform/transform/strided_slice_20/stack,transform/transform/strided_slice_20/stack_1,transform/transform/strided_slice_20/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_61/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_61/dense_shapePack$transform/transform/strided_slice_201transform/transform/SparseTensor_61/dense_shape/1*
N*
T0	*
_output_shapes
:
}
8transform/transform/sp2d-downscaled_avg_ti/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
ή
*transform/transform/sp2d-downscaled_avg_tiSparseToDenseNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy/transform/transform/SparseTensor_61/dense_shape$transform/transform/StringToNumber_28transform/transform/sp2d-downscaled_avg_ti/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
{
'transform/transform/zeros_like_10/ShapeShape$transform/transform/StringToNumber_2*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_10/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_10Fill'transform/transform/zeros_like_10/Shape'transform/transform/zeros_like_10/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_21/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_21/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_21/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_21StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2_copy*transform/transform/strided_slice_21/stack,transform/transform/strided_slice_21/stack_1,transform/transform/strided_slice_21/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_63/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_63/dense_shapePack$transform/transform/strided_slice_211transform/transform/SparseTensor_63/dense_shape/1*
N*
T0	*
_output_shapes
:

@transform/transform/sp2d-downscaled_avg_ti_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
λ
2transform/transform/sp2d-downscaled_avg_ti_missingSparseToDenseNtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_copy/transform/transform/SparseTensor_63/dense_shape!transform/transform/zeros_like_10@transform/transform/sp2d-downscaled_avg_ti_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_10Cast2transform/transform/sp2d-downscaled_avg_ti_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_22/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_22/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_22/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_22StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2_copy*transform/transform/strided_slice_22/stack,transform/transform/strided_slice_22/stack_1,transform/transform/strided_slice_22/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_64/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_64/dense_shapePack$transform/transform/strided_slice_221transform/transform/SparseTensor_64/dense_shape/1*
N*
T0	*
_output_shapes
:

Htransform/transform/sp2d-downscaled_avg_ti-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ρ
:transform/transform/sp2d-downscaled_avg_ti-log-transformedSparseToDense,transform/transform/boolean_mask_11/GatherV2/transform/transform/SparseTensor_64/dense_shapetransform/transform/Log_5Htransform/transform/sp2d-downscaled_avg_ti-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
p
'transform/transform/zeros_like_11/ShapeShapetransform/transform/Log_5*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_11/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_11Fill'transform/transform/zeros_like_11/Shape'transform/transform/zeros_like_11/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_23/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_23/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_23/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Τ
$transform/transform/strided_slice_23StridedSlicePtransform/transform/inputs/inputs/F_downscaled_avg_ti/F_downscaled_avg_ti_2_copy*transform/transform/strided_slice_23/stack,transform/transform/strided_slice_23/stack_1,transform/transform/strided_slice_23/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_66/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_66/dense_shapePack$transform/transform/strided_slice_231transform/transform/SparseTensor_66/dense_shape/1*
N*
T0	*
_output_shapes
:

Ptransform/transform/sp2d-downscaled_avg_ti-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
ι
Btransform/transform/sp2d-downscaled_avg_ti-log-transformed_missingSparseToDense,transform/transform/boolean_mask_11/GatherV2/transform/transform/SparseTensor_66/dense_shape!transform/transform/zeros_like_11Ptransform/transform/sp2d-downscaled_avg_ti-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????
¨
transform/transform/Cast_11CastBtransform/transform/sp2d-downscaled_avg_ti-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_24/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_24/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_24/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_24StridedSliceHtransform/transform/inputs/inputs/F_output_height/F_output_height_2_copy*transform/transform/strided_slice_24/stack,transform/transform/strided_slice_24/stack_1,transform/transform/strided_slice_24/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_67/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_67/dense_shapePack$transform/transform/strided_slice_241transform/transform/SparseTensor_67/dense_shape/1*
N*
T0	*
_output_shapes
:
y
4transform/transform/sp2d-output_height/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ξ
&transform/transform/sp2d-output_heightSparseToDenseFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy/transform/transform/SparseTensor_67/dense_shape$transform/transform/StringToNumber_74transform/transform/sp2d-output_height/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
{
'transform/transform/zeros_like_12/ShapeShape$transform/transform/StringToNumber_7*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_12/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_12Fill'transform/transform/zeros_like_12/Shape'transform/transform/zeros_like_12/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_25/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_25/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_25/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_25StridedSliceHtransform/transform/inputs/inputs/F_output_height/F_output_height_2_copy*transform/transform/strided_slice_25/stack,transform/transform/strided_slice_25/stack_1,transform/transform/strided_slice_25/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_69/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_69/dense_shapePack$transform/transform/strided_slice_251transform/transform/SparseTensor_69/dense_shape/1*
N*
T0	*
_output_shapes
:
~
<transform/transform/sp2d-output_height_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Ϋ
.transform/transform/sp2d-output_height_missingSparseToDenseFtransform/transform/inputs/inputs/F_output_height/F_output_height_copy/transform/transform/SparseTensor_69/dense_shape!transform/transform/zeros_like_12<transform/transform/sp2d-output_height_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_12Cast.transform/transform/sp2d-output_height_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_26/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_26/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_26/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_26StridedSliceHtransform/transform/inputs/inputs/F_output_height/F_output_height_2_copy*transform/transform/strided_slice_26/stack,transform/transform/strided_slice_26/stack_1,transform/transform/strided_slice_26/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_70/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_70/dense_shapePack$transform/transform/strided_slice_261transform/transform/SparseTensor_70/dense_shape/1*
N*
T0	*
_output_shapes
:

Dtransform/transform/sp2d-output_height-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ι
6transform/transform/sp2d-output_height-log-transformedSparseToDense,transform/transform/boolean_mask_13/GatherV2/transform/transform/SparseTensor_70/dense_shapetransform/transform/Log_6Dtransform/transform/sp2d-output_height-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
p
'transform/transform/zeros_like_13/ShapeShapetransform/transform/Log_6*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_13/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_13Fill'transform/transform/zeros_like_13/Shape'transform/transform/zeros_like_13/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_27/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_27/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_27/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_27StridedSliceHtransform/transform/inputs/inputs/F_output_height/F_output_height_2_copy*transform/transform/strided_slice_27/stack,transform/transform/strided_slice_27/stack_1,transform/transform/strided_slice_27/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_72/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_72/dense_shapePack$transform/transform/strided_slice_271transform/transform/SparseTensor_72/dense_shape/1*
N*
T0	*
_output_shapes
:

Ltransform/transform/sp2d-output_height-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
α
>transform/transform/sp2d-output_height-log-transformed_missingSparseToDense,transform/transform/boolean_mask_13/GatherV2/transform/transform/SparseTensor_72/dense_shape!transform/transform/zeros_like_13Ltransform/transform/sp2d-output_height-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????
€
transform/transform/Cast_13Cast>transform/transform/sp2d-output_height-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_28/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_28/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_28/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_28StridedSlice6transform/transform/inputs/inputs/pixels/pixels_2_copy*transform/transform/strided_slice_28/stack,transform/transform/strided_slice_28/stack_1,transform/transform/strided_slice_28/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_73/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_73/dense_shapePack$transform/transform/strided_slice_281transform/transform/SparseTensor_73/dense_shape/1*
N*
T0	*
_output_shapes
:
r
-transform/transform/sp2d-pixels/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
?
transform/transform/sp2d-pixelsSparseToDense4transform/transform/inputs/inputs/pixels/pixels_copy/transform/transform/SparseTensor_73/dense_shape$transform/transform/StringToNumber_9-transform/transform/sp2d-pixels/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
{
'transform/transform/zeros_like_14/ShapeShape$transform/transform/StringToNumber_9*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_14/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_14Fill'transform/transform/zeros_like_14/Shape'transform/transform/zeros_like_14/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_29/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_29/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_29/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_29StridedSlice6transform/transform/inputs/inputs/pixels/pixels_2_copy*transform/transform/strided_slice_29/stack,transform/transform/strided_slice_29/stack_1,transform/transform/strided_slice_29/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_75/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_75/dense_shapePack$transform/transform/strided_slice_291transform/transform/SparseTensor_75/dense_shape/1*
N*
T0	*
_output_shapes
:
w
5transform/transform/sp2d-pixels_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
»
'transform/transform/sp2d-pixels_missingSparseToDense4transform/transform/inputs/inputs/pixels/pixels_copy/transform/transform/SparseTensor_75/dense_shape!transform/transform/zeros_like_145transform/transform/sp2d-pixels_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_14Cast'transform/transform/sp2d-pixels_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_30/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_30/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_30/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_30StridedSlice6transform/transform/inputs/inputs/pixels/pixels_2_copy*transform/transform/strided_slice_30/stack,transform/transform/strided_slice_30/stack_1,transform/transform/strided_slice_30/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_76/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_76/dense_shapePack$transform/transform/strided_slice_301transform/transform/SparseTensor_76/dense_shape/1*
N*
T0	*
_output_shapes
:

=transform/transform/sp2d-pixels-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
»
/transform/transform/sp2d-pixels-log-transformedSparseToDense,transform/transform/boolean_mask_15/GatherV2/transform/transform/SparseTensor_76/dense_shapetransform/transform/Log_7=transform/transform/sp2d-pixels-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
p
'transform/transform/zeros_like_15/ShapeShapetransform/transform/Log_7*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_15/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_15Fill'transform/transform/zeros_like_15/Shape'transform/transform/zeros_like_15/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_31/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_31/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_31/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ί
$transform/transform/strided_slice_31StridedSlice6transform/transform/inputs/inputs/pixels/pixels_2_copy*transform/transform/strided_slice_31/stack,transform/transform/strided_slice_31/stack_1,transform/transform/strided_slice_31/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_78/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_78/dense_shapePack$transform/transform/strided_slice_311transform/transform/SparseTensor_78/dense_shape/1*
N*
T0	*
_output_shapes
:

Etransform/transform/sp2d-pixels-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Σ
7transform/transform/sp2d-pixels-log-transformed_missingSparseToDense,transform/transform/boolean_mask_15/GatherV2/transform/transform/SparseTensor_78/dense_shape!transform/transform/zeros_like_15Etransform/transform/sp2d-pixels-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_15Cast7transform/transform/sp2d-pixels-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_32/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_32/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_32/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_32StridedSliceHtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_2_copy*transform/transform/strided_slice_32/stack,transform/transform/strided_slice_32/stack_1,transform/transform/strided_slice_32/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_79/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_79/dense_shapePack$transform/transform/strided_slice_321transform/transform/SparseTensor_79/dense_shape/1*
N*
T0	*
_output_shapes
:
y
4transform/transform/sp2d-output_pixels/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ξ
&transform/transform/sp2d-output_pixelsSparseToDenseFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy/transform/transform/SparseTensor_79/dense_shape$transform/transform/StringToNumber_84transform/transform/sp2d-output_pixels/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
{
'transform/transform/zeros_like_16/ShapeShape$transform/transform/StringToNumber_8*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_16/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_16Fill'transform/transform/zeros_like_16/Shape'transform/transform/zeros_like_16/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_33/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_33/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_33/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_33StridedSliceHtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_2_copy*transform/transform/strided_slice_33/stack,transform/transform/strided_slice_33/stack_1,transform/transform/strided_slice_33/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_81/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_81/dense_shapePack$transform/transform/strided_slice_331transform/transform/SparseTensor_81/dense_shape/1*
N*
T0	*
_output_shapes
:
~
<transform/transform/sp2d-output_pixels_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Ϋ
.transform/transform/sp2d-output_pixels_missingSparseToDenseFtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_copy/transform/transform/SparseTensor_81/dense_shape!transform/transform/zeros_like_16<transform/transform/sp2d-output_pixels_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_16Cast.transform/transform/sp2d-output_pixels_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_34/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_34/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_34/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_34StridedSliceHtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_2_copy*transform/transform/strided_slice_34/stack,transform/transform/strided_slice_34/stack_1,transform/transform/strided_slice_34/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_82/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_82/dense_shapePack$transform/transform/strided_slice_341transform/transform/SparseTensor_82/dense_shape/1*
N*
T0	*
_output_shapes
:

Dtransform/transform/sp2d-output_pixels-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ι
6transform/transform/sp2d-output_pixels-log-transformedSparseToDense,transform/transform/boolean_mask_17/GatherV2/transform/transform/SparseTensor_82/dense_shapetransform/transform/Log_8Dtransform/transform/sp2d-output_pixels-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
p
'transform/transform/zeros_like_17/ShapeShapetransform/transform/Log_8*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_17/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_17Fill'transform/transform/zeros_like_17/Shape'transform/transform/zeros_like_17/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_35/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_35/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_35/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Μ
$transform/transform/strided_slice_35StridedSliceHtransform/transform/inputs/inputs/F_output_pixels/F_output_pixels_2_copy*transform/transform/strided_slice_35/stack,transform/transform/strided_slice_35/stack_1,transform/transform/strided_slice_35/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_84/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_84/dense_shapePack$transform/transform/strided_slice_351transform/transform/SparseTensor_84/dense_shape/1*
N*
T0	*
_output_shapes
:

Ltransform/transform/sp2d-output_pixels-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
α
>transform/transform/sp2d-output_pixels-log-transformed_missingSparseToDense,transform/transform/boolean_mask_17/GatherV2/transform/transform/SparseTensor_84/dense_shape!transform/transform/zeros_like_17Ltransform/transform/sp2d-output_pixels-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????
€
transform/transform/Cast_17Cast>transform/transform/sp2d-output_pixels-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_36/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_36/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_36/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Έ
$transform/transform/strided_slice_36StridedSlice4transform/transform/inputs/inputs/cores/cores_2_copy*transform/transform/strided_slice_36/stack,transform/transform/strided_slice_36/stack_1,transform/transform/strided_slice_36/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_85/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_85/dense_shapePack$transform/transform/strided_slice_361transform/transform/SparseTensor_85/dense_shape/1*
N*
T0	*
_output_shapes
:
q
,transform/transform/sp2d-cores/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
¨
transform/transform/sp2d-coresSparseToDense2transform/transform/inputs/inputs/cores/cores_copy/transform/transform/SparseTensor_85/dense_shape"transform/transform/StringToNumber,transform/transform/sp2d-cores/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
y
'transform/transform/zeros_like_18/ShapeShape"transform/transform/StringToNumber*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_18/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_18Fill'transform/transform/zeros_like_18/Shape'transform/transform/zeros_like_18/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_37/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_37/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_37/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Έ
$transform/transform/strided_slice_37StridedSlice4transform/transform/inputs/inputs/cores/cores_2_copy*transform/transform/strided_slice_37/stack,transform/transform/strided_slice_37/stack_1,transform/transform/strided_slice_37/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_87/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_87/dense_shapePack$transform/transform/strided_slice_371transform/transform/SparseTensor_87/dense_shape/1*
N*
T0	*
_output_shapes
:
v
4transform/transform/sp2d-cores_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
·
&transform/transform/sp2d-cores_missingSparseToDense2transform/transform/inputs/inputs/cores/cores_copy/transform/transform/SparseTensor_87/dense_shape!transform/transform/zeros_like_184transform/transform/sp2d-cores_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_18Cast&transform/transform/sp2d-cores_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
t
*transform/transform/strided_slice_38/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_38/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_38/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Έ
$transform/transform/strided_slice_38StridedSlice4transform/transform/inputs/inputs/cores/cores_2_copy*transform/transform/strided_slice_38/stack,transform/transform/strided_slice_38/stack_1,transform/transform/strided_slice_38/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_88/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_88/dense_shapePack$transform/transform/strided_slice_381transform/transform/SparseTensor_88/dense_shape/1*
N*
T0	*
_output_shapes
:

<transform/transform/sp2d-cores-log-transformed/default_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ή
.transform/transform/sp2d-cores-log-transformedSparseToDense,transform/transform/boolean_mask_19/GatherV2/transform/transform/SparseTensor_88/dense_shapetransform/transform/Log_9<transform/transform/sp2d-cores-log-transformed/default_value*
T0*
Tindices0	*'
_output_shapes
:?????????
p
'transform/transform/zeros_like_19/ShapeShapetransform/transform/Log_9*
T0*
_output_shapes
:
i
'transform/transform/zeros_like_19/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
!transform/transform/zeros_like_19Fill'transform/transform/zeros_like_19/Shape'transform/transform/zeros_like_19/Const*
T0	*#
_output_shapes
:?????????
t
*transform/transform/strided_slice_39/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,transform/transform/strided_slice_39/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
v
,transform/transform/strided_slice_39/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Έ
$transform/transform/strided_slice_39StridedSlice4transform/transform/inputs/inputs/cores/cores_2_copy*transform/transform/strided_slice_39/stack,transform/transform/strided_slice_39/stack_1,transform/transform/strided_slice_39/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
s
1transform/transform/SparseTensor_90/dense_shape/1Const*
_output_shapes
: *
dtype0	*
value	B	 R
Ύ
/transform/transform/SparseTensor_90/dense_shapePack$transform/transform/strided_slice_391transform/transform/SparseTensor_90/dense_shape/1*
N*
T0	*
_output_shapes
:

Dtransform/transform/sp2d-cores-log-transformed_missing/default_valueConst*
_output_shapes
: *
dtype0	*
value	B	 R
Ρ
6transform/transform/sp2d-cores-log-transformed_missingSparseToDense,transform/transform/boolean_mask_19/GatherV2/transform/transform/SparseTensor_90/dense_shape!transform/transform/zeros_like_19Dtransform/transform/sp2d-cores-log-transformed_missing/default_value*
T0	*
Tindices0	*'
_output_shapes
:?????????

transform/transform/Cast_19Cast6transform/transform/sp2d-cores-log-transformed_missing*

DstT0
*

SrcT0	*'
_output_shapes
:?????????
ό
transform/transform/stackPack!transform/transform/sp2d-duration1transform/transform/sp2d-duration-log-transformedtransform/transform/sp2d-fps,transform/transform/sp2d-fps-log-transformed+transform/transform/sp2d-downscaled_bitrate;transform/transform/sp2d-downscaled_bitrate-log-transformedtransform/transform/sp2d-height/transform/transform/sp2d-height-log-transformed*transform/transform/sp2d-downscaled_avg_si:transform/transform/sp2d-downscaled_avg_si-log-transformed*transform/transform/sp2d-downscaled_avg_ti:transform/transform/sp2d-downscaled_avg_ti-log-transformed&transform/transform/sp2d-output_height6transform/transform/sp2d-output_height-log-transformedtransform/transform/sp2d-pixels/transform/transform/sp2d-pixels-log-transformed&transform/transform/sp2d-output_pixels6transform/transform/sp2d-output_pixels-log-transformedtransform/transform/sp2d-cores.transform/transform/sp2d-cores-log-transformed*
N*
T0*+
_output_shapes
:?????????*

axis
¦
transform/transform/stack_1Packtransform/transform/Casttransform/transform/Cast_1transform/transform/Cast_2transform/transform/Cast_3transform/transform/Cast_4transform/transform/Cast_5transform/transform/Cast_6transform/transform/Cast_7transform/transform/Cast_8transform/transform/Cast_9transform/transform/Cast_10transform/transform/Cast_11transform/transform/Cast_12transform/transform/Cast_13transform/transform/Cast_14transform/transform/Cast_15transform/transform/Cast_16transform/transform/Cast_17transform/transform/Cast_18transform/transform/Cast_19*
N*
T0
*+
_output_shapes
:?????????*

axis
r
transform/transform/ShapeShapetransform/transform/stack*
T0*
_output_shapes
:*
out_type0	
d
transform/transform/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    
₯
transform/transform/zerosFilltransform/transform/Shapetransform/transform/zeros/Const*
T0*+
_output_shapes
:?????????*

index_type0	

7transform/transform/scale_to_z_score/mean_and_var/ShapeShapetransform/transform/stack*
T0*
_output_shapes
:

Etransform/transform/scale_to_z_score/mean_and_var/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Gtransform/transform/scale_to_z_score/mean_and_var/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 

Gtransform/transform/scale_to_z_score/mean_and_var/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
£
?transform/transform/scale_to_z_score/mean_and_var/strided_sliceStridedSlice7transform/transform/scale_to_z_score/mean_and_var/ShapeEtransform/transform/scale_to_z_score/mean_and_var/strided_slice/stackGtransform/transform/scale_to_z_score/mean_and_var/strided_slice/stack_1Gtransform/transform/scale_to_z_score/mean_and_var/strided_slice/stack_2*
Index0*
T0*
_output_shapes
:*
end_mask

Gtransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 

Itransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Itransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
―
Atransform/transform/scale_to_z_score/mean_and_var/strided_slice_1StridedSlice7transform/transform/scale_to_z_score/mean_and_var/ShapeGtransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stackItransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stack_1Itransform/transform/scale_to_z_score/mean_and_var/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
λ
6transform/transform/scale_to_z_score/mean_and_var/FillFill?transform/transform/scale_to_z_score/mean_and_var/strided_sliceAtransform/transform/scale_to_z_score/mean_and_var/strided_slice_1*
T0*
_output_shapes

:
?
6transform/transform/scale_to_z_score/mean_and_var/CastCast6transform/transform/scale_to_z_score/mean_and_var/Fill*

DstT0*

SrcT0*
_output_shapes

:

Gtransform/transform/scale_to_z_score/mean_and_var/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : 
Ι
5transform/transform/scale_to_z_score/mean_and_var/SumSumtransform/transform/stackGtransform/transform/scale_to_z_score/mean_and_var/Sum/reduction_indices*
T0*
_output_shapes

:
ά
9transform/transform/scale_to_z_score/mean_and_var/truedivRealDiv5transform/transform/scale_to_z_score/mean_and_var/Sum6transform/transform/scale_to_z_score/mean_and_var/Cast*
T0*
_output_shapes

:
Θ
5transform/transform/scale_to_z_score/mean_and_var/subSubtransform/transform/stack9transform/transform/scale_to_z_score/mean_and_var/truediv*
T0*+
_output_shapes
:?????????
―
8transform/transform/scale_to_z_score/mean_and_var/SquareSquare5transform/transform/scale_to_z_score/mean_and_var/sub*
T0*+
_output_shapes
:?????????

Itransform/transform/scale_to_z_score/mean_and_var/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : 
μ
7transform/transform/scale_to_z_score/mean_and_var/Sum_1Sum8transform/transform/scale_to_z_score/mean_and_var/SquareItransform/transform/scale_to_z_score/mean_and_var/Sum_1/reduction_indices*
T0*
_output_shapes

:
ΰ
;transform/transform/scale_to_z_score/mean_and_var/truediv_1RealDiv7transform/transform/scale_to_z_score/mean_and_var/Sum_16transform/transform/scale_to_z_score/mean_and_var/Cast*
T0*
_output_shapes

:
|
7transform/transform/scale_to_z_score/mean_and_var/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    

@transform/transform/scale_to_z_score/mean_and_var/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B : 
ρ
<transform/transform/scale_to_z_score/mean_and_var/ExpandDims
ExpandDims6transform/transform/scale_to_z_score/mean_and_var/Cast@transform/transform/scale_to_z_score/mean_and_var/ExpandDims/dim*
T0*"
_output_shapes
:

=transform/transform/scale_to_z_score/mean_and_var/PlaceholderPlaceholder*
_output_shapes

:*
dtype0*
shape
:

?transform/transform/scale_to_z_score/mean_and_var/Placeholder_1Placeholder*
_output_shapes

:*
dtype0*
shape
:

(transform/transform/scale_to_z_score/subSubtransform/transform/stacktransform/Const*
T0*+
_output_shapes
:?????????
m
)transform/transform/scale_to_z_score/SqrtSqrttransform/Const_1*
T0*
_output_shapes

:
t
/transform/transform/scale_to_z_score/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
Ύ
-transform/transform/scale_to_z_score/NotEqualNotEqual)transform/transform/scale_to_z_score/Sqrt/transform/transform/scale_to_z_score/NotEqual/y*
T0*
_output_shapes

:

/transform/transform/scale_to_z_score/zeros_like	ZerosLike(transform/transform/scale_to_z_score/sub*
T0*+
_output_shapes
:?????????

)transform/transform/scale_to_z_score/CastCast-transform/transform/scale_to_z_score/NotEqual*

DstT0*

SrcT0
*
_output_shapes

:
Γ
(transform/transform/scale_to_z_score/addAddV2/transform/transform/scale_to_z_score/zeros_like)transform/transform/scale_to_z_score/Cast*
T0*+
_output_shapes
:?????????
’
+transform/transform/scale_to_z_score/Cast_1Cast(transform/transform/scale_to_z_score/add*

DstT0
*

SrcT0*+
_output_shapes
:?????????
Β
,transform/transform/scale_to_z_score/truedivRealDiv(transform/transform/scale_to_z_score/sub)transform/transform/scale_to_z_score/Sqrt*
T0*+
_output_shapes
:?????????
τ
-transform/transform/scale_to_z_score/SelectV2SelectV2+transform/transform/scale_to_z_score/Cast_1,transform/transform/scale_to_z_score/truediv(transform/transform/scale_to_z_score/sub*
T0*+
_output_shapes
:?????????
Α
transform/transform/SelectSelecttransform/transform/stack_1transform/transform/zeros-transform/transform/scale_to_z_score/SelectV2*
T0*+
_output_shapes
:?????????
{
*transform/transform/strided_slice_40/stackConst*
_output_shapes
:*
dtype0*
valueB"        
}
,transform/transform/strided_slice_40/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_40/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_40StridedSlicetransform/transform/Select*transform/transform/strided_slice_40/stack,transform/transform/strided_slice_40/stack_1,transform/transform/strided_slice_40/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_41/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_41/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_41/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_41StridedSlicetransform/transform/Select*transform/transform/strided_slice_41/stack,transform/transform/strided_slice_41/stack_1,transform/transform/strided_slice_41/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_42/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_42/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_42/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_42StridedSlicetransform/transform/Select*transform/transform/strided_slice_42/stack,transform/transform/strided_slice_42/stack_1,transform/transform/strided_slice_42/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_43/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_43/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_43/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_43StridedSlicetransform/transform/Select*transform/transform/strided_slice_43/stack,transform/transform/strided_slice_43/stack_1,transform/transform/strided_slice_43/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_44/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_44/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_44/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_44StridedSlicetransform/transform/Select*transform/transform/strided_slice_44/stack,transform/transform/strided_slice_44/stack_1,transform/transform/strided_slice_44/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_45/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_45/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_45/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_45StridedSlicetransform/transform/Select*transform/transform/strided_slice_45/stack,transform/transform/strided_slice_45/stack_1,transform/transform/strided_slice_45/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_46/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_46/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_46/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_46StridedSlicetransform/transform/Select*transform/transform/strided_slice_46/stack,transform/transform/strided_slice_46/stack_1,transform/transform/strided_slice_46/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_47/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_47/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_47/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_47StridedSlicetransform/transform/Select*transform/transform/strided_slice_47/stack,transform/transform/strided_slice_47/stack_1,transform/transform/strided_slice_47/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_48/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_48/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    	   
}
,transform/transform/strided_slice_48/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_48StridedSlicetransform/transform/Select*transform/transform/strided_slice_48/stack,transform/transform/strided_slice_48/stack_1,transform/transform/strided_slice_48/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_49/stackConst*
_output_shapes
:*
dtype0*
valueB"    	   
}
,transform/transform/strided_slice_49/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    
   
}
,transform/transform/strided_slice_49/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_49StridedSlicetransform/transform/Select*transform/transform/strided_slice_49/stack,transform/transform/strided_slice_49/stack_1,transform/transform/strided_slice_49/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_50/stackConst*
_output_shapes
:*
dtype0*
valueB"    
   
}
,transform/transform/strided_slice_50/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_50/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_50StridedSlicetransform/transform/Select*transform/transform/strided_slice_50/stack,transform/transform/strided_slice_50/stack_1,transform/transform/strided_slice_50/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_51/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_51/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_51/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_51StridedSlicetransform/transform/Select*transform/transform/strided_slice_51/stack,transform/transform/strided_slice_51/stack_1,transform/transform/strided_slice_51/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_52/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_52/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_52/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_52StridedSlicetransform/transform/Select*transform/transform/strided_slice_52/stack,transform/transform/strided_slice_52/stack_1,transform/transform/strided_slice_52/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_53/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_53/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_53/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_53StridedSlicetransform/transform/Select*transform/transform/strided_slice_53/stack,transform/transform/strided_slice_53/stack_1,transform/transform/strided_slice_53/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_54/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_54/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_54/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_54StridedSlicetransform/transform/Select*transform/transform/strided_slice_54/stack,transform/transform/strided_slice_54/stack_1,transform/transform/strided_slice_54/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_55/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_55/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_55/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_55StridedSlicetransform/transform/Select*transform/transform/strided_slice_55/stack,transform/transform/strided_slice_55/stack_1,transform/transform/strided_slice_55/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_56/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_56/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_56/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_56StridedSlicetransform/transform/Select*transform/transform/strided_slice_56/stack,transform/transform/strided_slice_56/stack_1,transform/transform/strided_slice_56/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_57/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_57/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_57/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_57StridedSlicetransform/transform/Select*transform/transform/strided_slice_57/stack,transform/transform/strided_slice_57/stack_1,transform/transform/strided_slice_57/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_58/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_58/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_58/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_58StridedSlicetransform/transform/Select*transform/transform/strided_slice_58/stack,transform/transform/strided_slice_58/stack_1,transform/transform/strided_slice_58/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask
{
*transform/transform/strided_slice_59/stackConst*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_59/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
}
,transform/transform/strided_slice_59/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      
Ρ
$transform/transform/strided_slice_59StridedSlicetransform/transform/Select*transform/transform/strided_slice_59/stack,transform/transform/strided_slice_59/stack_1,transform/transform/strided_slice_59/stack_2*
Index0*
T0*'
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

transform/transform/Shape_1Shape6transform/transform/inputs/inputs/preset/preset_1_copy*
T0*
_output_shapes
:
`
transform/transform/Fill/valueConst*
_output_shapes
: *
dtype0*
value	B B$

transform/transform/FillFilltransform/transform/Shape_1transform/transform/Fill/value*
T0*#
_output_shapes
:?????????
¬
transform/transform/StringJoin
StringJointransform/transform/Fill6transform/transform/inputs/inputs/preset/preset_1_copy*
N*#
_output_shapes
:?????????
y
-transform/transform/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0*
valueB B _MISSING_ 
ξ
;transform/transform/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows4transform/transform/inputs/inputs/preset/preset_copytransform/transform/StringJoin6transform/transform/inputs/inputs/preset/preset_2_copy-transform/transform/SparseFillEmptyRows/Const*
T0*T
_output_shapesB
@:?????????:?????????:?????????:?????????

,transform/transform/vocabulary/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
Μ
&transform/transform/vocabulary/ReshapeReshape=transform/transform/SparseFillEmptyRows/SparseFillEmptyRows:1,transform/transform/vocabulary/Reshape/shape*
T0*#
_output_shapes
:?????????

?transform/transform/vocabulary/preset_vocab_unpruned_vocab_sizePlaceholder*
_output_shapes
: *
dtype0	*
shape: 
k
*transform/transform/vocabulary/PlaceholderPlaceholder*
_output_shapes
: *
dtype0*
shape: 
g
%transform/transform/apply_vocab/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 
Σ
*transform/transform/apply_vocab/hash_tableHashTableV2*
_output_shapes
: *
	key_dtype0*\
shared_nameMKhash_table_Tensor("vocabulary/Placeholder:0", shape=(), dtype=string)_-2_-1*
value_dtype0	
Ψ
Ltransform/transform/apply_vocab/text_file_init/InitializeTableFromTextFileV2InitializeTableFromTextFileV2*transform/transform/apply_vocab/hash_tableConst_1*
	key_indexώ????????*
value_index?????????
¦
Ctransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2LookupTableFindV2*transform/transform/apply_vocab/hash_table=transform/transform/SparseFillEmptyRows/SparseFillEmptyRows:1%transform/transform/apply_vocab/Const*	
Tin0*

Tout0	*#
_output_shapes
:?????????

Atransform/transform/apply_vocab/hash_table_Size/LookupTableSizeV2LookupTableSizeV2*transform/transform/apply_vocab/hash_table*
_output_shapes
: 
i
'transform/transform/apply_vocab/Const_1Const*
_output_shapes
: *
dtype0	*
value	B	 R 
g
%transform/transform/apply_vocab/sub/yConst*
_output_shapes
: *
dtype0	*
value	B	 R
΅
#transform/transform/apply_vocab/subSubAtransform/transform/apply_vocab/hash_table_Size/LookupTableSizeV2%transform/transform/apply_vocab/sub/y*
T0	*
_output_shapes
: 
k
)transform/transform/apply_vocab/Minimum/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
§
'transform/transform/apply_vocab/MinimumMinimum'transform/transform/apply_vocab/Const_1)transform/transform/apply_vocab/Minimum/y*
T0	*
_output_shapes
: 
k
)transform/transform/apply_vocab/Maximum/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
£
'transform/transform/apply_vocab/MaximumMaximum#transform/transform/apply_vocab/sub)transform/transform/apply_vocab/Maximum/y*
T0	*
_output_shapes
: 
 
transform/transform/initNoOp
"
transform/transform/init_1NoOp

transform/initNoOp

global_step/Initializer/zerosConst*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
value	B	 R 

global_stepVarHandleOp*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
shape: *
shared_nameglobal_step
g
,global_step/IsInitialized/VarIsInitializedOpVarIsInitializedOpglobal_step*
_output_shapes
: 
_
global_step/AssignAssignVariableOpglobal_stepglobal_step/Initializer/zeros*
dtype0	
c
global_step/Read/ReadVariableOpReadVariableOpglobal_step*
_output_shapes
: *
dtype0	
Y
ShapeShape$transform/transform/strided_slice_41*
T0*
_output_shapes
:
]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
­
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
s
1trial1/input_layer/preset_embedding/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :

/trial1/input_layer/preset_embedding/num_bucketsCast1trial1/input_layer/preset_embedding/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
l
*trial1/input_layer/preset_embedding/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial1/input_layer/preset_embedding/zeroCast*trial1/input_layer/preset_embedding/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
Ν
(trial1/input_layer/preset_embedding/LessLessCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2(trial1/input_layer/preset_embedding/zero*
T0	*#
_output_shapes
:?????????
δ
0trial1/input_layer/preset_embedding/GreaterEqualGreaterEqualCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2/trial1/input_layer/preset_embedding/num_buckets*
T0	*#
_output_shapes
:?????????
Ύ
0trial1/input_layer/preset_embedding/out_of_range	LogicalOr(trial1/input_layer/preset_embedding/Less0trial1/input_layer/preset_embedding/GreaterEqual*#
_output_shapes
:?????????

)trial1/input_layer/preset_embedding/ShapeShapeCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*
_output_shapes
:
l
*trial1/input_layer/preset_embedding/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial1/input_layer/preset_embedding/CastCast*trial1/input_layer/preset_embedding/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
½
2trial1/input_layer/preset_embedding/default_valuesFill)trial1/input_layer/preset_embedding/Shape(trial1/input_layer/preset_embedding/Cast*
T0	*#
_output_shapes
:?????????

,trial1/input_layer/preset_embedding/SelectV2SelectV20trial1/input_layer/preset_embedding/out_of_range2trial1/input_layer/preset_embedding/default_valuesCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:?????????
σ
Xtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"      
ζ
Wtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
θ
Ytrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *Α>
Ο
btrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Vtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulMulbtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalYtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes

:
ύ
Rtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normalAddVtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulWtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes

:

5trial1/input_layer/preset_embedding/embedding_weightsVarHandleOp*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape
:*F
shared_name75trial1/input_layer/preset_embedding/embedding_weights
»
Vtrial1/input_layer/preset_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOp5trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes
: 
θ
<trial1/input_layer/preset_embedding/embedding_weights/AssignAssignVariableOp5trial1/input_layer/preset_embedding/embedding_weightsRtrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
Ώ
Itrial1/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpReadVariableOp5trial1/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Htrial1/input_layer/preset_embedding/preset_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Gtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Θ
Btrial1/input_layer/preset_embedding/preset_embedding_weights/SliceSlice6transform/transform/inputs/inputs/preset/preset_2_copyHtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice/beginGtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:

Btrial1/input_layer/preset_embedding/preset_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
ς
Atrial1/input_layer/preset_embedding/preset_embedding_weights/ProdProdBtrial1/input_layer/preset_embedding/preset_embedding_weights/SliceBtrial1/input_layer/preset_embedding/preset_embedding_weights/Const*
T0	*
_output_shapes
: 

Mtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :

Jtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
θ
Etrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2GatherV26transform/transform/inputs/inputs/preset/preset_2_copyMtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesJtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Ctrial1/input_layer/preset_embedding/preset_embedding_weights/Cast/xPackAtrial1/input_layer/preset_embedding/preset_embedding_weights/ProdEtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
Δ
Jtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeSparseReshape;transform/transform/SparseFillEmptyRows/SparseFillEmptyRows6transform/transform/inputs/inputs/preset/preset_2_copyCtrial1/input_layer/preset_embedding/preset_embedding_weights/Cast/x*-
_output_shapes
:?????????:
»
Strial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityIdentity,trial1/input_layer/preset_embedding/SelectV2*
T0	*#
_output_shapes
:?????????

Ktrial1/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
Itrial1/input_layer/preset_embedding/preset_embedding_weights/GreaterEqualGreaterEqualStrial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityKtrial1/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
Ώ
Btrial1/input_layer/preset_embedding/preset_embedding_weights/WhereWhereItrial1/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual*'
_output_shapes
:?????????

Jtrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????

Dtrial1/input_layer/preset_embedding/preset_embedding_weights/ReshapeReshapeBtrial1/input_layer/preset_embedding/preset_embedding_weights/WhereJtrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????

Ltrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1GatherV2Jtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeDtrial1/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????

Ltrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2GatherV2Strial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityDtrial1/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
Δ
Etrial1/input_layer/preset_embedding/preset_embedding_weights/IdentityIdentityLtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:

Vtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 

dtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsGtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1Gtrial1/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2Etrial1/input_layer/preset_embedding/preset_embedding_weights/IdentityVtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
Ή
htrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
»
jtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
»
jtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      

btrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicedtrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowshtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackjtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1jtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

[trial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/UniqueUniqueftrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????

etrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGather5trial1/input_layer/preset_embedding/embedding_weights[trial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????*
dtype0
έ
ntrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentityetrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*H
_class>
<:loc:@trial1/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????

ptrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identityntrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*'
_output_shapes
:?????????
β
Ttrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparseSparseSegmentSumptrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1]trial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique:1btrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice*
T0*
Tsegmentids0	*'
_output_shapes
:?????????

Ltrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   
Ή
Ftrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Reshapeftrial1/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2Ltrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
Ζ
Btrial1/input_layer/preset_embedding/preset_embedding_weights/ShapeShapeTtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:

Ptrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Rtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Rtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ή
Jtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_sliceStridedSliceBtrial1/input_layer/preset_embedding/preset_embedding_weights/ShapePtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackRtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Rtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask

Dtrial1/input_layer/preset_embedding/preset_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :

Btrial1/input_layer/preset_embedding/preset_embedding_weights/stackPackDtrial1/input_layer/preset_embedding/preset_embedding_weights/stack/0Jtrial1/input_layer/preset_embedding/preset_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:

Atrial1/input_layer/preset_embedding/preset_embedding_weights/TileTileFtrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Btrial1/input_layer/preset_embedding/preset_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
ά
Gtrial1/input_layer/preset_embedding/preset_embedding_weights/zeros_like	ZerosLikeTtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
Ϊ
<trial1/input_layer/preset_embedding/preset_embedding_weightsSelectAtrial1/input_layer/preset_embedding/preset_embedding_weights/TileGtrial1/input_layer/preset_embedding/preset_embedding_weights/zeros_likeTtrial1/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
·
Ctrial1/input_layer/preset_embedding/preset_embedding_weights/Cast_1Cast6transform/transform/inputs/inputs/preset/preset_2_copy*

DstT0*

SrcT0	*
_output_shapes
:

Jtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Itrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Ϋ
Dtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1SliceCtrial1/input_layer/preset_embedding/preset_embedding_weights/Cast_1Jtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginItrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
°
Dtrial1/input_layer/preset_embedding/preset_embedding_weights/Shape_1Shape<trial1/input_layer/preset_embedding/preset_embedding_weights*
T0*
_output_shapes
:

Jtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:

Itrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
ά
Dtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2SliceDtrial1/input_layer/preset_embedding/preset_embedding_weights/Shape_1Jtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginItrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:

Htrial1/input_layer/preset_embedding/preset_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Σ
Ctrial1/input_layer/preset_embedding/preset_embedding_weights/concatConcatV2Dtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_1Dtrial1/input_layer/preset_embedding/preset_embedding_weights/Slice_2Htrial1/input_layer/preset_embedding/preset_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:

Ftrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_2Reshape<trial1/input_layer/preset_embedding/preset_embedding_weightsCtrial1/input_layer/preset_embedding/preset_embedding_weights/concat*
T0*'
_output_shapes
:?????????
‘
+trial1/input_layer/preset_embedding/Shape_1ShapeFtrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_2*
T0*
_output_shapes
:

7trial1/input_layer/preset_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9trial1/input_layer/preset_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9trial1/input_layer/preset_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
γ
1trial1/input_layer/preset_embedding/strided_sliceStridedSlice+trial1/input_layer/preset_embedding/Shape_17trial1/input_layer/preset_embedding/strided_slice/stack9trial1/input_layer/preset_embedding/strided_slice/stack_19trial1/input_layer/preset_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
u
3trial1/input_layer/preset_embedding/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ο
1trial1/input_layer/preset_embedding/Reshape/shapePack1trial1/input_layer/preset_embedding/strided_slice3trial1/input_layer/preset_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:
γ
+trial1/input_layer/preset_embedding/ReshapeReshapeFtrial1/input_layer/preset_embedding/preset_embedding_weights/Reshape_21trial1/input_layer/preset_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
f
$trial1/input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :

 trial1/input_layer/concat/concatIdentity+trial1/input_layer/preset_embedding/Reshape*
T0*'
_output_shapes
:?????????
\
trial1/ShapeShape trial1/input_layer/concat/concat*
T0*
_output_shapes
:
d
trial1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
f
trial1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
trial1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Π
trial1/strided_sliceStridedSlicetrial1/Shapetrial1/strided_slice/stacktrial1/strided_slice/stack_1trial1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
Y
trial1/CastCasttrial1/strided_slice*

DstT0*

SrcT0*
_output_shapes
: 
]
trial1/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

trial1/concatConcatV2 trial1/input_layer/concat/concat$transform/transform/strided_slice_58$transform/transform/strided_slice_59$transform/transform/strided_slice_48$transform/transform/strided_slice_49$transform/transform/strided_slice_50$transform/transform/strided_slice_51$transform/transform/strided_slice_44$transform/transform/strided_slice_45$transform/transform/strided_slice_40$transform/transform/strided_slice_41$transform/transform/strided_slice_42$transform/transform/strided_slice_43$transform/transform/strided_slice_46$transform/transform/strided_slice_47$transform/transform/strided_slice_52$transform/transform/strided_slice_53$transform/transform/strided_slice_56$transform/transform/strided_slice_57$transform/transform/strided_slice_54$transform/transform/strided_slice_55trial1/concat/axis*
N*
T0*'
_output_shapes
:?????????
­
4trial1/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@trial1/dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

2trial1/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@trial1/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ

2trial1/dense/kernel/Initializer/random_uniform/maxConst*&
_class
loc:@trial1/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
β
<trial1/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4trial1/dense/kernel/Initializer/random_uniform/shape*
T0*&
_class
loc:@trial1/dense/kernel*
_output_shapes
:	*
dtype0
κ
2trial1/dense/kernel/Initializer/random_uniform/subSub2trial1/dense/kernel/Initializer/random_uniform/max2trial1/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial1/dense/kernel*
_output_shapes
: 
ύ
2trial1/dense/kernel/Initializer/random_uniform/mulMul<trial1/dense/kernel/Initializer/random_uniform/RandomUniform2trial1/dense/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@trial1/dense/kernel*
_output_shapes
:	
ο
.trial1/dense/kernel/Initializer/random_uniformAdd2trial1/dense/kernel/Initializer/random_uniform/mul2trial1/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial1/dense/kernel*
_output_shapes
:	
«
trial1/dense/kernelVarHandleOp*&
_class
loc:@trial1/dense/kernel*
_output_shapes
: *
dtype0*
shape:	*$
shared_nametrial1/dense/kernel
w
4trial1/dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense/kernel*
_output_shapes
: 

trial1/dense/kernel/AssignAssignVariableOptrial1/dense/kernel.trial1/dense/kernel/Initializer/random_uniform*
dtype0
|
'trial1/dense/kernel/Read/ReadVariableOpReadVariableOptrial1/dense/kernel*
_output_shapes
:	*
dtype0

#trial1/dense/bias/Initializer/zerosConst*$
_class
loc:@trial1/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
‘
trial1/dense/biasVarHandleOp*$
_class
loc:@trial1/dense/bias*
_output_shapes
: *
dtype0*
shape:*"
shared_nametrial1/dense/bias
s
2trial1/dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense/bias*
_output_shapes
: 
q
trial1/dense/bias/AssignAssignVariableOptrial1/dense/bias#trial1/dense/bias/Initializer/zeros*
dtype0
t
%trial1/dense/bias/Read/ReadVariableOpReadVariableOptrial1/dense/bias*
_output_shapes	
:*
dtype0
w
"trial1/dense/MatMul/ReadVariableOpReadVariableOptrial1/dense/kernel*
_output_shapes
:	*
dtype0

trial1/dense/MatMulMatMultrial1/concat"trial1/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
r
#trial1/dense/BiasAdd/ReadVariableOpReadVariableOptrial1/dense/bias*
_output_shapes	
:*
dtype0

trial1/dense/BiasAddBiasAddtrial1/dense/MatMul#trial1/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
\
trial1/ReluRelutrial1/dense/BiasAdd*
T0*(
_output_shapes
:?????????
c
trial1/dropout/IdentityIdentitytrial1/Relu*
T0*(
_output_shapes
:?????????
±
6trial1/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial1/dense_1/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ
£
4trial1/dense_1/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
θ
>trial1/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial1/dense_1/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
:	*
dtype0
ς
4trial1/dense_1/kernel/Initializer/random_uniform/subSub4trial1/dense_1/kernel/Initializer/random_uniform/max4trial1/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
: 

4trial1/dense_1/kernel/Initializer/random_uniform/mulMul>trial1/dense_1/kernel/Initializer/random_uniform/RandomUniform4trial1/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
:	
χ
0trial1/dense_1/kernel/Initializer/random_uniformAdd4trial1/dense_1/kernel/Initializer/random_uniform/mul4trial1/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
:	
±
trial1/dense_1/kernelVarHandleOp*(
_class
loc:@trial1/dense_1/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial1/dense_1/kernel
{
6trial1/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_1/kernel*
_output_shapes
: 

trial1/dense_1/kernel/AssignAssignVariableOptrial1/dense_1/kernel0trial1/dense_1/kernel/Initializer/random_uniform*
dtype0

)trial1/dense_1/kernel/Read/ReadVariableOpReadVariableOptrial1/dense_1/kernel*
_output_shapes
:	*
dtype0

%trial1/dense_1/bias/Initializer/zerosConst*&
_class
loc:@trial1/dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
trial1/dense_1/biasVarHandleOp*&
_class
loc:@trial1/dense_1/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial1/dense_1/bias
w
4trial1/dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_1/bias*
_output_shapes
: 
w
trial1/dense_1/bias/AssignAssignVariableOptrial1/dense_1/bias%trial1/dense_1/bias/Initializer/zeros*
dtype0
x
'trial1/dense_1/bias/Read/ReadVariableOpReadVariableOptrial1/dense_1/bias*
_output_shapes	
:*
dtype0
{
$trial1/dense_1/MatMul/ReadVariableOpReadVariableOptrial1/dense_1/kernel*
_output_shapes
:	*
dtype0

trial1/dense_1/MatMulMatMultrial1/concat$trial1/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial1/dense_1/BiasAdd/ReadVariableOpReadVariableOptrial1/dense_1/bias*
_output_shapes	
:*
dtype0

trial1/dense_1/BiasAddBiasAddtrial1/dense_1/MatMul%trial1/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
w

trial1/addAddV2trial1/dropout/Identitytrial1/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial1/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial1/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial1/dense_2/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial1/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial1/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial1/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial1/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial1/dense_2/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial1/dense_2/kernel* 
_output_shapes
:
*
dtype0
ς
4trial1/dense_2/kernel/Initializer/random_uniform/subSub4trial1/dense_2/kernel/Initializer/random_uniform/max4trial1/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_2/kernel*
_output_shapes
: 

4trial1/dense_2/kernel/Initializer/random_uniform/mulMul>trial1/dense_2/kernel/Initializer/random_uniform/RandomUniform4trial1/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial1/dense_2/kernel* 
_output_shapes
:

ψ
0trial1/dense_2/kernel/Initializer/random_uniformAdd4trial1/dense_2/kernel/Initializer/random_uniform/mul4trial1/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_2/kernel* 
_output_shapes
:

²
trial1/dense_2/kernelVarHandleOp*(
_class
loc:@trial1/dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial1/dense_2/kernel
{
6trial1/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_2/kernel*
_output_shapes
: 

trial1/dense_2/kernel/AssignAssignVariableOptrial1/dense_2/kernel0trial1/dense_2/kernel/Initializer/random_uniform*
dtype0

)trial1/dense_2/kernel/Read/ReadVariableOpReadVariableOptrial1/dense_2/kernel* 
_output_shapes
:
*
dtype0
¨
5trial1/dense_2/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial1/dense_2/bias*
_output_shapes
:*
dtype0*
valueB:

+trial1/dense_2/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial1/dense_2/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial1/dense_2/bias/Initializer/zerosFill5trial1/dense_2/bias/Initializer/zeros/shape_as_tensor+trial1/dense_2/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial1/dense_2/bias*
_output_shapes	
:
§
trial1/dense_2/biasVarHandleOp*&
_class
loc:@trial1/dense_2/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial1/dense_2/bias
w
4trial1/dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_2/bias*
_output_shapes
: 
w
trial1/dense_2/bias/AssignAssignVariableOptrial1/dense_2/bias%trial1/dense_2/bias/Initializer/zeros*
dtype0
x
'trial1/dense_2/bias/Read/ReadVariableOpReadVariableOptrial1/dense_2/bias*
_output_shapes	
:*
dtype0
|
$trial1/dense_2/MatMul/ReadVariableOpReadVariableOptrial1/dense_2/kernel* 
_output_shapes
:
*
dtype0

trial1/dense_2/MatMulMatMul
trial1/add$trial1/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial1/dense_2/BiasAdd/ReadVariableOpReadVariableOptrial1/dense_2/bias*
_output_shapes	
:*
dtype0

trial1/dense_2/BiasAddBiasAddtrial1/dense_2/MatMul%trial1/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
`
trial1/Relu_1Relutrial1/dense_2/BiasAdd*
T0*(
_output_shapes
:?????????
g
trial1/dropout_1/IdentityIdentitytrial1/Relu_1*
T0*(
_output_shapes
:?????????
±
6trial1/dense_3/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial1/dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial1/dense_3/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial1/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial1/dense_3/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial1/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial1/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial1/dense_3/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial1/dense_3/kernel* 
_output_shapes
:
*
dtype0
ς
4trial1/dense_3/kernel/Initializer/random_uniform/subSub4trial1/dense_3/kernel/Initializer/random_uniform/max4trial1/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_3/kernel*
_output_shapes
: 

4trial1/dense_3/kernel/Initializer/random_uniform/mulMul>trial1/dense_3/kernel/Initializer/random_uniform/RandomUniform4trial1/dense_3/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial1/dense_3/kernel* 
_output_shapes
:

ψ
0trial1/dense_3/kernel/Initializer/random_uniformAdd4trial1/dense_3/kernel/Initializer/random_uniform/mul4trial1/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_3/kernel* 
_output_shapes
:

²
trial1/dense_3/kernelVarHandleOp*(
_class
loc:@trial1/dense_3/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial1/dense_3/kernel
{
6trial1/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_3/kernel*
_output_shapes
: 

trial1/dense_3/kernel/AssignAssignVariableOptrial1/dense_3/kernel0trial1/dense_3/kernel/Initializer/random_uniform*
dtype0

)trial1/dense_3/kernel/Read/ReadVariableOpReadVariableOptrial1/dense_3/kernel* 
_output_shapes
:
*
dtype0
¨
5trial1/dense_3/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial1/dense_3/bias*
_output_shapes
:*
dtype0*
valueB:

+trial1/dense_3/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial1/dense_3/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial1/dense_3/bias/Initializer/zerosFill5trial1/dense_3/bias/Initializer/zeros/shape_as_tensor+trial1/dense_3/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial1/dense_3/bias*
_output_shapes	
:
§
trial1/dense_3/biasVarHandleOp*&
_class
loc:@trial1/dense_3/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial1/dense_3/bias
w
4trial1/dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_3/bias*
_output_shapes
: 
w
trial1/dense_3/bias/AssignAssignVariableOptrial1/dense_3/bias%trial1/dense_3/bias/Initializer/zeros*
dtype0
x
'trial1/dense_3/bias/Read/ReadVariableOpReadVariableOptrial1/dense_3/bias*
_output_shapes	
:*
dtype0
|
$trial1/dense_3/MatMul/ReadVariableOpReadVariableOptrial1/dense_3/kernel* 
_output_shapes
:
*
dtype0

trial1/dense_3/MatMulMatMul
trial1/add$trial1/dense_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial1/dense_3/BiasAdd/ReadVariableOpReadVariableOptrial1/dense_3/bias*
_output_shapes	
:*
dtype0

trial1/dense_3/BiasAddBiasAddtrial1/dense_3/MatMul%trial1/dense_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
{
trial1/add_1AddV2trial1/dropout_1/Identitytrial1/dense_3/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial1/dense_4/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial1/dense_4/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°½
£
4trial1/dense_4/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°=
θ
>trial1/dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial1/dense_4/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
:	*
dtype0
ς
4trial1/dense_4/kernel/Initializer/random_uniform/subSub4trial1/dense_4/kernel/Initializer/random_uniform/max4trial1/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
: 

4trial1/dense_4/kernel/Initializer/random_uniform/mulMul>trial1/dense_4/kernel/Initializer/random_uniform/RandomUniform4trial1/dense_4/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
:	
χ
0trial1/dense_4/kernel/Initializer/random_uniformAdd4trial1/dense_4/kernel/Initializer/random_uniform/mul4trial1/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
:	
±
trial1/dense_4/kernelVarHandleOp*(
_class
loc:@trial1/dense_4/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial1/dense_4/kernel
{
6trial1/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_4/kernel*
_output_shapes
: 

trial1/dense_4/kernel/AssignAssignVariableOptrial1/dense_4/kernel0trial1/dense_4/kernel/Initializer/random_uniform*
dtype0

)trial1/dense_4/kernel/Read/ReadVariableOpReadVariableOptrial1/dense_4/kernel*
_output_shapes
:	*
dtype0

%trial1/dense_4/bias/Initializer/zerosConst*&
_class
loc:@trial1/dense_4/bias*
_output_shapes
:*
dtype0*
valueB*    
¦
trial1/dense_4/biasVarHandleOp*&
_class
loc:@trial1/dense_4/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial1/dense_4/bias
w
4trial1/dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial1/dense_4/bias*
_output_shapes
: 
w
trial1/dense_4/bias/AssignAssignVariableOptrial1/dense_4/bias%trial1/dense_4/bias/Initializer/zeros*
dtype0
w
'trial1/dense_4/bias/Read/ReadVariableOpReadVariableOptrial1/dense_4/bias*
_output_shapes
:*
dtype0
{
$trial1/dense_4/MatMul/ReadVariableOpReadVariableOptrial1/dense_4/kernel*
_output_shapes
:	*
dtype0

trial1/dense_4/MatMulMatMultrial1/add_1$trial1/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
u
%trial1/dense_4/BiasAdd/ReadVariableOpReadVariableOptrial1/dense_4/bias*
_output_shapes
:*
dtype0

trial1/dense_4/BiasAddBiasAddtrial1/dense_4/MatMul%trial1/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????
^
IdentityIdentitytrial1/dense_4/BiasAdd*
T0*'
_output_shapes
:?????????

Aplaceholder/trial1/input_layer/preset_embedding/embedding_weightsPlaceholder*
_output_shapes

:*
dtype0*
shape
:
«
AssignVariableOpAssignVariableOp5trial1/input_layer/preset_embedding/embedding_weightsAplaceholder/trial1/input_layer/preset_embedding/embedding_weights*
dtype0

ReadVariableOpReadVariableOp5trial1/input_layer/preset_embedding/embedding_weights^AssignVariableOp*
_output_shapes

:*
dtype0
r
placeholder/trial1/dense/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
i
AssignVariableOp_1AssignVariableOptrial1/dense/kernelplaceholder/trial1/dense/kernel*
dtype0
z
ReadVariableOp_1ReadVariableOptrial1/dense/kernel^AssignVariableOp_1*
_output_shapes
:	*
dtype0
h
placeholder/trial1/dense/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
e
AssignVariableOp_2AssignVariableOptrial1/dense/biasplaceholder/trial1/dense/bias*
dtype0
t
ReadVariableOp_2ReadVariableOptrial1/dense/bias^AssignVariableOp_2*
_output_shapes	
:*
dtype0
t
!placeholder/trial1/dense_1/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
m
AssignVariableOp_3AssignVariableOptrial1/dense_1/kernel!placeholder/trial1/dense_1/kernel*
dtype0
|
ReadVariableOp_3ReadVariableOptrial1/dense_1/kernel^AssignVariableOp_3*
_output_shapes
:	*
dtype0
j
placeholder/trial1/dense_1/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
i
AssignVariableOp_4AssignVariableOptrial1/dense_1/biasplaceholder/trial1/dense_1/bias*
dtype0
v
ReadVariableOp_4ReadVariableOptrial1/dense_1/bias^AssignVariableOp_4*
_output_shapes	
:*
dtype0
v
!placeholder/trial1/dense_2/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

m
AssignVariableOp_5AssignVariableOptrial1/dense_2/kernel!placeholder/trial1/dense_2/kernel*
dtype0
}
ReadVariableOp_5ReadVariableOptrial1/dense_2/kernel^AssignVariableOp_5* 
_output_shapes
:
*
dtype0
j
placeholder/trial1/dense_2/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
i
AssignVariableOp_6AssignVariableOptrial1/dense_2/biasplaceholder/trial1/dense_2/bias*
dtype0
v
ReadVariableOp_6ReadVariableOptrial1/dense_2/bias^AssignVariableOp_6*
_output_shapes	
:*
dtype0
v
!placeholder/trial1/dense_3/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

m
AssignVariableOp_7AssignVariableOptrial1/dense_3/kernel!placeholder/trial1/dense_3/kernel*
dtype0
}
ReadVariableOp_7ReadVariableOptrial1/dense_3/kernel^AssignVariableOp_7* 
_output_shapes
:
*
dtype0
j
placeholder/trial1/dense_3/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
i
AssignVariableOp_8AssignVariableOptrial1/dense_3/biasplaceholder/trial1/dense_3/bias*
dtype0
v
ReadVariableOp_8ReadVariableOptrial1/dense_3/bias^AssignVariableOp_8*
_output_shapes	
:*
dtype0
t
!placeholder/trial1/dense_4/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
m
AssignVariableOp_9AssignVariableOptrial1/dense_4/kernel!placeholder/trial1/dense_4/kernel*
dtype0
|
ReadVariableOp_9ReadVariableOptrial1/dense_4/kernel^AssignVariableOp_9*
_output_shapes
:	*
dtype0
h
placeholder/trial1/dense_4/biasPlaceholder*
_output_shapes
:*
dtype0*
shape:
j
AssignVariableOp_10AssignVariableOptrial1/dense_4/biasplaceholder/trial1/dense_4/bias*
dtype0
w
ReadVariableOp_10ReadVariableOptrial1/dense_4/bias^AssignVariableOp_10*
_output_shapes
:*
dtype0
ψ

group_depsNoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9
[
Shape_1Shape$transform/transform/strided_slice_41*
T0*
_output_shapes
:
_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
·
strided_slice_1StridedSliceShape_1strided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
s
1trial2/input_layer/preset_embedding/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :

/trial2/input_layer/preset_embedding/num_bucketsCast1trial2/input_layer/preset_embedding/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
l
*trial2/input_layer/preset_embedding/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial2/input_layer/preset_embedding/zeroCast*trial2/input_layer/preset_embedding/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
Ν
(trial2/input_layer/preset_embedding/LessLessCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2(trial2/input_layer/preset_embedding/zero*
T0	*#
_output_shapes
:?????????
δ
0trial2/input_layer/preset_embedding/GreaterEqualGreaterEqualCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2/trial2/input_layer/preset_embedding/num_buckets*
T0	*#
_output_shapes
:?????????
Ύ
0trial2/input_layer/preset_embedding/out_of_range	LogicalOr(trial2/input_layer/preset_embedding/Less0trial2/input_layer/preset_embedding/GreaterEqual*#
_output_shapes
:?????????

)trial2/input_layer/preset_embedding/ShapeShapeCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*
_output_shapes
:
l
*trial2/input_layer/preset_embedding/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial2/input_layer/preset_embedding/CastCast*trial2/input_layer/preset_embedding/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
½
2trial2/input_layer/preset_embedding/default_valuesFill)trial2/input_layer/preset_embedding/Shape(trial2/input_layer/preset_embedding/Cast*
T0	*#
_output_shapes
:?????????

,trial2/input_layer/preset_embedding/SelectV2SelectV20trial2/input_layer/preset_embedding/out_of_range2trial2/input_layer/preset_embedding/default_valuesCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:?????????
σ
Xtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"      
ζ
Wtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
θ
Ytrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *Α>
Ο
btrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Vtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulMulbtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalYtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes

:
ύ
Rtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normalAddVtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulWtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes

:

5trial2/input_layer/preset_embedding/embedding_weightsVarHandleOp*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape
:*F
shared_name75trial2/input_layer/preset_embedding/embedding_weights
»
Vtrial2/input_layer/preset_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOp5trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes
: 
θ
<trial2/input_layer/preset_embedding/embedding_weights/AssignAssignVariableOp5trial2/input_layer/preset_embedding/embedding_weightsRtrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
Ώ
Itrial2/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpReadVariableOp5trial2/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Htrial2/input_layer/preset_embedding/preset_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Gtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Θ
Btrial2/input_layer/preset_embedding/preset_embedding_weights/SliceSlice6transform/transform/inputs/inputs/preset/preset_2_copyHtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice/beginGtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:

Btrial2/input_layer/preset_embedding/preset_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
ς
Atrial2/input_layer/preset_embedding/preset_embedding_weights/ProdProdBtrial2/input_layer/preset_embedding/preset_embedding_weights/SliceBtrial2/input_layer/preset_embedding/preset_embedding_weights/Const*
T0	*
_output_shapes
: 

Mtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :

Jtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
θ
Etrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2GatherV26transform/transform/inputs/inputs/preset/preset_2_copyMtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesJtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Ctrial2/input_layer/preset_embedding/preset_embedding_weights/Cast/xPackAtrial2/input_layer/preset_embedding/preset_embedding_weights/ProdEtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
Δ
Jtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeSparseReshape;transform/transform/SparseFillEmptyRows/SparseFillEmptyRows6transform/transform/inputs/inputs/preset/preset_2_copyCtrial2/input_layer/preset_embedding/preset_embedding_weights/Cast/x*-
_output_shapes
:?????????:
»
Strial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityIdentity,trial2/input_layer/preset_embedding/SelectV2*
T0	*#
_output_shapes
:?????????

Ktrial2/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
Itrial2/input_layer/preset_embedding/preset_embedding_weights/GreaterEqualGreaterEqualStrial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityKtrial2/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
Ώ
Btrial2/input_layer/preset_embedding/preset_embedding_weights/WhereWhereItrial2/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual*'
_output_shapes
:?????????

Jtrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????

Dtrial2/input_layer/preset_embedding/preset_embedding_weights/ReshapeReshapeBtrial2/input_layer/preset_embedding/preset_embedding_weights/WhereJtrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????

Ltrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1GatherV2Jtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeDtrial2/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????

Ltrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2GatherV2Strial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityDtrial2/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
Δ
Etrial2/input_layer/preset_embedding/preset_embedding_weights/IdentityIdentityLtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:

Vtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 

dtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsGtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1Gtrial2/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2Etrial2/input_layer/preset_embedding/preset_embedding_weights/IdentityVtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
Ή
htrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
»
jtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
»
jtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      

btrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicedtrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowshtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackjtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1jtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

[trial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/UniqueUniqueftrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????

etrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGather5trial2/input_layer/preset_embedding/embedding_weights[trial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????*
dtype0
έ
ntrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentityetrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*H
_class>
<:loc:@trial2/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????

ptrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identityntrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*'
_output_shapes
:?????????
β
Ttrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparseSparseSegmentSumptrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1]trial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique:1btrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice*
T0*
Tsegmentids0	*'
_output_shapes
:?????????

Ltrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   
Ή
Ftrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Reshapeftrial2/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2Ltrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
Ζ
Btrial2/input_layer/preset_embedding/preset_embedding_weights/ShapeShapeTtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:

Ptrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Rtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Rtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ή
Jtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_sliceStridedSliceBtrial2/input_layer/preset_embedding/preset_embedding_weights/ShapePtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackRtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Rtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask

Dtrial2/input_layer/preset_embedding/preset_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :

Btrial2/input_layer/preset_embedding/preset_embedding_weights/stackPackDtrial2/input_layer/preset_embedding/preset_embedding_weights/stack/0Jtrial2/input_layer/preset_embedding/preset_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:

Atrial2/input_layer/preset_embedding/preset_embedding_weights/TileTileFtrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Btrial2/input_layer/preset_embedding/preset_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
ά
Gtrial2/input_layer/preset_embedding/preset_embedding_weights/zeros_like	ZerosLikeTtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
Ϊ
<trial2/input_layer/preset_embedding/preset_embedding_weightsSelectAtrial2/input_layer/preset_embedding/preset_embedding_weights/TileGtrial2/input_layer/preset_embedding/preset_embedding_weights/zeros_likeTtrial2/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
·
Ctrial2/input_layer/preset_embedding/preset_embedding_weights/Cast_1Cast6transform/transform/inputs/inputs/preset/preset_2_copy*

DstT0*

SrcT0	*
_output_shapes
:

Jtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Itrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Ϋ
Dtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1SliceCtrial2/input_layer/preset_embedding/preset_embedding_weights/Cast_1Jtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginItrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
°
Dtrial2/input_layer/preset_embedding/preset_embedding_weights/Shape_1Shape<trial2/input_layer/preset_embedding/preset_embedding_weights*
T0*
_output_shapes
:

Jtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:

Itrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
ά
Dtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2SliceDtrial2/input_layer/preset_embedding/preset_embedding_weights/Shape_1Jtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginItrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:

Htrial2/input_layer/preset_embedding/preset_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Σ
Ctrial2/input_layer/preset_embedding/preset_embedding_weights/concatConcatV2Dtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_1Dtrial2/input_layer/preset_embedding/preset_embedding_weights/Slice_2Htrial2/input_layer/preset_embedding/preset_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:

Ftrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_2Reshape<trial2/input_layer/preset_embedding/preset_embedding_weightsCtrial2/input_layer/preset_embedding/preset_embedding_weights/concat*
T0*'
_output_shapes
:?????????
‘
+trial2/input_layer/preset_embedding/Shape_1ShapeFtrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_2*
T0*
_output_shapes
:

7trial2/input_layer/preset_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9trial2/input_layer/preset_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9trial2/input_layer/preset_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
γ
1trial2/input_layer/preset_embedding/strided_sliceStridedSlice+trial2/input_layer/preset_embedding/Shape_17trial2/input_layer/preset_embedding/strided_slice/stack9trial2/input_layer/preset_embedding/strided_slice/stack_19trial2/input_layer/preset_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
u
3trial2/input_layer/preset_embedding/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ο
1trial2/input_layer/preset_embedding/Reshape/shapePack1trial2/input_layer/preset_embedding/strided_slice3trial2/input_layer/preset_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:
γ
+trial2/input_layer/preset_embedding/ReshapeReshapeFtrial2/input_layer/preset_embedding/preset_embedding_weights/Reshape_21trial2/input_layer/preset_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
f
$trial2/input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :

 trial2/input_layer/concat/concatIdentity+trial2/input_layer/preset_embedding/Reshape*
T0*'
_output_shapes
:?????????
\
trial2/ShapeShape trial2/input_layer/concat/concat*
T0*
_output_shapes
:
d
trial2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
f
trial2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
trial2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Π
trial2/strided_sliceStridedSlicetrial2/Shapetrial2/strided_slice/stacktrial2/strided_slice/stack_1trial2/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
Y
trial2/CastCasttrial2/strided_slice*

DstT0*

SrcT0*
_output_shapes
: 
]
trial2/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

trial2/concatConcatV2 trial2/input_layer/concat/concat$transform/transform/strided_slice_58$transform/transform/strided_slice_59$transform/transform/strided_slice_48$transform/transform/strided_slice_49$transform/transform/strided_slice_50$transform/transform/strided_slice_51$transform/transform/strided_slice_44$transform/transform/strided_slice_45$transform/transform/strided_slice_40$transform/transform/strided_slice_41$transform/transform/strided_slice_42$transform/transform/strided_slice_43$transform/transform/strided_slice_46$transform/transform/strided_slice_47$transform/transform/strided_slice_52$transform/transform/strided_slice_53$transform/transform/strided_slice_56$transform/transform/strided_slice_57$transform/transform/strided_slice_54$transform/transform/strided_slice_55trial2/concat/axis*
N*
T0*'
_output_shapes
:?????????
­
4trial2/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@trial2/dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

2trial2/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@trial2/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ

2trial2/dense/kernel/Initializer/random_uniform/maxConst*&
_class
loc:@trial2/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
β
<trial2/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4trial2/dense/kernel/Initializer/random_uniform/shape*
T0*&
_class
loc:@trial2/dense/kernel*
_output_shapes
:	*
dtype0
κ
2trial2/dense/kernel/Initializer/random_uniform/subSub2trial2/dense/kernel/Initializer/random_uniform/max2trial2/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial2/dense/kernel*
_output_shapes
: 
ύ
2trial2/dense/kernel/Initializer/random_uniform/mulMul<trial2/dense/kernel/Initializer/random_uniform/RandomUniform2trial2/dense/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@trial2/dense/kernel*
_output_shapes
:	
ο
.trial2/dense/kernel/Initializer/random_uniformAdd2trial2/dense/kernel/Initializer/random_uniform/mul2trial2/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial2/dense/kernel*
_output_shapes
:	
«
trial2/dense/kernelVarHandleOp*&
_class
loc:@trial2/dense/kernel*
_output_shapes
: *
dtype0*
shape:	*$
shared_nametrial2/dense/kernel
w
4trial2/dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense/kernel*
_output_shapes
: 

trial2/dense/kernel/AssignAssignVariableOptrial2/dense/kernel.trial2/dense/kernel/Initializer/random_uniform*
dtype0
|
'trial2/dense/kernel/Read/ReadVariableOpReadVariableOptrial2/dense/kernel*
_output_shapes
:	*
dtype0

#trial2/dense/bias/Initializer/zerosConst*$
_class
loc:@trial2/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
‘
trial2/dense/biasVarHandleOp*$
_class
loc:@trial2/dense/bias*
_output_shapes
: *
dtype0*
shape:*"
shared_nametrial2/dense/bias
s
2trial2/dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense/bias*
_output_shapes
: 
q
trial2/dense/bias/AssignAssignVariableOptrial2/dense/bias#trial2/dense/bias/Initializer/zeros*
dtype0
t
%trial2/dense/bias/Read/ReadVariableOpReadVariableOptrial2/dense/bias*
_output_shapes	
:*
dtype0
w
"trial2/dense/MatMul/ReadVariableOpReadVariableOptrial2/dense/kernel*
_output_shapes
:	*
dtype0

trial2/dense/MatMulMatMultrial2/concat"trial2/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
r
#trial2/dense/BiasAdd/ReadVariableOpReadVariableOptrial2/dense/bias*
_output_shapes	
:*
dtype0

trial2/dense/BiasAddBiasAddtrial2/dense/MatMul#trial2/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
\
trial2/ReluRelutrial2/dense/BiasAdd*
T0*(
_output_shapes
:?????????
c
trial2/dropout/IdentityIdentitytrial2/Relu*
T0*(
_output_shapes
:?????????
±
6trial2/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial2/dense_1/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ
£
4trial2/dense_1/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
θ
>trial2/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial2/dense_1/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
:	*
dtype0
ς
4trial2/dense_1/kernel/Initializer/random_uniform/subSub4trial2/dense_1/kernel/Initializer/random_uniform/max4trial2/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
: 

4trial2/dense_1/kernel/Initializer/random_uniform/mulMul>trial2/dense_1/kernel/Initializer/random_uniform/RandomUniform4trial2/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
:	
χ
0trial2/dense_1/kernel/Initializer/random_uniformAdd4trial2/dense_1/kernel/Initializer/random_uniform/mul4trial2/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
:	
±
trial2/dense_1/kernelVarHandleOp*(
_class
loc:@trial2/dense_1/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial2/dense_1/kernel
{
6trial2/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_1/kernel*
_output_shapes
: 

trial2/dense_1/kernel/AssignAssignVariableOptrial2/dense_1/kernel0trial2/dense_1/kernel/Initializer/random_uniform*
dtype0

)trial2/dense_1/kernel/Read/ReadVariableOpReadVariableOptrial2/dense_1/kernel*
_output_shapes
:	*
dtype0

%trial2/dense_1/bias/Initializer/zerosConst*&
_class
loc:@trial2/dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
trial2/dense_1/biasVarHandleOp*&
_class
loc:@trial2/dense_1/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial2/dense_1/bias
w
4trial2/dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_1/bias*
_output_shapes
: 
w
trial2/dense_1/bias/AssignAssignVariableOptrial2/dense_1/bias%trial2/dense_1/bias/Initializer/zeros*
dtype0
x
'trial2/dense_1/bias/Read/ReadVariableOpReadVariableOptrial2/dense_1/bias*
_output_shapes	
:*
dtype0
{
$trial2/dense_1/MatMul/ReadVariableOpReadVariableOptrial2/dense_1/kernel*
_output_shapes
:	*
dtype0

trial2/dense_1/MatMulMatMultrial2/concat$trial2/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial2/dense_1/BiasAdd/ReadVariableOpReadVariableOptrial2/dense_1/bias*
_output_shapes	
:*
dtype0

trial2/dense_1/BiasAddBiasAddtrial2/dense_1/MatMul%trial2/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
w

trial2/addAddV2trial2/dropout/Identitytrial2/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial2/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial2/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial2/dense_2/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial2/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial2/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial2/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial2/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial2/dense_2/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial2/dense_2/kernel* 
_output_shapes
:
*
dtype0
ς
4trial2/dense_2/kernel/Initializer/random_uniform/subSub4trial2/dense_2/kernel/Initializer/random_uniform/max4trial2/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_2/kernel*
_output_shapes
: 

4trial2/dense_2/kernel/Initializer/random_uniform/mulMul>trial2/dense_2/kernel/Initializer/random_uniform/RandomUniform4trial2/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial2/dense_2/kernel* 
_output_shapes
:

ψ
0trial2/dense_2/kernel/Initializer/random_uniformAdd4trial2/dense_2/kernel/Initializer/random_uniform/mul4trial2/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_2/kernel* 
_output_shapes
:

²
trial2/dense_2/kernelVarHandleOp*(
_class
loc:@trial2/dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial2/dense_2/kernel
{
6trial2/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_2/kernel*
_output_shapes
: 

trial2/dense_2/kernel/AssignAssignVariableOptrial2/dense_2/kernel0trial2/dense_2/kernel/Initializer/random_uniform*
dtype0

)trial2/dense_2/kernel/Read/ReadVariableOpReadVariableOptrial2/dense_2/kernel* 
_output_shapes
:
*
dtype0
¨
5trial2/dense_2/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial2/dense_2/bias*
_output_shapes
:*
dtype0*
valueB:

+trial2/dense_2/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial2/dense_2/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial2/dense_2/bias/Initializer/zerosFill5trial2/dense_2/bias/Initializer/zeros/shape_as_tensor+trial2/dense_2/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial2/dense_2/bias*
_output_shapes	
:
§
trial2/dense_2/biasVarHandleOp*&
_class
loc:@trial2/dense_2/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial2/dense_2/bias
w
4trial2/dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_2/bias*
_output_shapes
: 
w
trial2/dense_2/bias/AssignAssignVariableOptrial2/dense_2/bias%trial2/dense_2/bias/Initializer/zeros*
dtype0
x
'trial2/dense_2/bias/Read/ReadVariableOpReadVariableOptrial2/dense_2/bias*
_output_shapes	
:*
dtype0
|
$trial2/dense_2/MatMul/ReadVariableOpReadVariableOptrial2/dense_2/kernel* 
_output_shapes
:
*
dtype0

trial2/dense_2/MatMulMatMul
trial2/add$trial2/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial2/dense_2/BiasAdd/ReadVariableOpReadVariableOptrial2/dense_2/bias*
_output_shapes	
:*
dtype0

trial2/dense_2/BiasAddBiasAddtrial2/dense_2/MatMul%trial2/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
`
trial2/Relu_1Relutrial2/dense_2/BiasAdd*
T0*(
_output_shapes
:?????????
g
trial2/dropout_1/IdentityIdentitytrial2/Relu_1*
T0*(
_output_shapes
:?????????
±
6trial2/dense_3/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial2/dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial2/dense_3/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial2/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial2/dense_3/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial2/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial2/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial2/dense_3/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial2/dense_3/kernel* 
_output_shapes
:
*
dtype0
ς
4trial2/dense_3/kernel/Initializer/random_uniform/subSub4trial2/dense_3/kernel/Initializer/random_uniform/max4trial2/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_3/kernel*
_output_shapes
: 

4trial2/dense_3/kernel/Initializer/random_uniform/mulMul>trial2/dense_3/kernel/Initializer/random_uniform/RandomUniform4trial2/dense_3/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial2/dense_3/kernel* 
_output_shapes
:

ψ
0trial2/dense_3/kernel/Initializer/random_uniformAdd4trial2/dense_3/kernel/Initializer/random_uniform/mul4trial2/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_3/kernel* 
_output_shapes
:

²
trial2/dense_3/kernelVarHandleOp*(
_class
loc:@trial2/dense_3/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial2/dense_3/kernel
{
6trial2/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_3/kernel*
_output_shapes
: 

trial2/dense_3/kernel/AssignAssignVariableOptrial2/dense_3/kernel0trial2/dense_3/kernel/Initializer/random_uniform*
dtype0

)trial2/dense_3/kernel/Read/ReadVariableOpReadVariableOptrial2/dense_3/kernel* 
_output_shapes
:
*
dtype0
¨
5trial2/dense_3/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial2/dense_3/bias*
_output_shapes
:*
dtype0*
valueB:

+trial2/dense_3/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial2/dense_3/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial2/dense_3/bias/Initializer/zerosFill5trial2/dense_3/bias/Initializer/zeros/shape_as_tensor+trial2/dense_3/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial2/dense_3/bias*
_output_shapes	
:
§
trial2/dense_3/biasVarHandleOp*&
_class
loc:@trial2/dense_3/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial2/dense_3/bias
w
4trial2/dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_3/bias*
_output_shapes
: 
w
trial2/dense_3/bias/AssignAssignVariableOptrial2/dense_3/bias%trial2/dense_3/bias/Initializer/zeros*
dtype0
x
'trial2/dense_3/bias/Read/ReadVariableOpReadVariableOptrial2/dense_3/bias*
_output_shapes	
:*
dtype0
|
$trial2/dense_3/MatMul/ReadVariableOpReadVariableOptrial2/dense_3/kernel* 
_output_shapes
:
*
dtype0

trial2/dense_3/MatMulMatMul
trial2/add$trial2/dense_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial2/dense_3/BiasAdd/ReadVariableOpReadVariableOptrial2/dense_3/bias*
_output_shapes	
:*
dtype0

trial2/dense_3/BiasAddBiasAddtrial2/dense_3/MatMul%trial2/dense_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
{
trial2/add_1AddV2trial2/dropout_1/Identitytrial2/dense_3/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial2/dense_4/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial2/dense_4/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°½
£
4trial2/dense_4/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°=
θ
>trial2/dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial2/dense_4/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
:	*
dtype0
ς
4trial2/dense_4/kernel/Initializer/random_uniform/subSub4trial2/dense_4/kernel/Initializer/random_uniform/max4trial2/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
: 

4trial2/dense_4/kernel/Initializer/random_uniform/mulMul>trial2/dense_4/kernel/Initializer/random_uniform/RandomUniform4trial2/dense_4/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
:	
χ
0trial2/dense_4/kernel/Initializer/random_uniformAdd4trial2/dense_4/kernel/Initializer/random_uniform/mul4trial2/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
:	
±
trial2/dense_4/kernelVarHandleOp*(
_class
loc:@trial2/dense_4/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial2/dense_4/kernel
{
6trial2/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_4/kernel*
_output_shapes
: 

trial2/dense_4/kernel/AssignAssignVariableOptrial2/dense_4/kernel0trial2/dense_4/kernel/Initializer/random_uniform*
dtype0

)trial2/dense_4/kernel/Read/ReadVariableOpReadVariableOptrial2/dense_4/kernel*
_output_shapes
:	*
dtype0

%trial2/dense_4/bias/Initializer/zerosConst*&
_class
loc:@trial2/dense_4/bias*
_output_shapes
:*
dtype0*
valueB*    
¦
trial2/dense_4/biasVarHandleOp*&
_class
loc:@trial2/dense_4/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial2/dense_4/bias
w
4trial2/dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial2/dense_4/bias*
_output_shapes
: 
w
trial2/dense_4/bias/AssignAssignVariableOptrial2/dense_4/bias%trial2/dense_4/bias/Initializer/zeros*
dtype0
w
'trial2/dense_4/bias/Read/ReadVariableOpReadVariableOptrial2/dense_4/bias*
_output_shapes
:*
dtype0
{
$trial2/dense_4/MatMul/ReadVariableOpReadVariableOptrial2/dense_4/kernel*
_output_shapes
:	*
dtype0

trial2/dense_4/MatMulMatMultrial2/add_1$trial2/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
u
%trial2/dense_4/BiasAdd/ReadVariableOpReadVariableOptrial2/dense_4/bias*
_output_shapes
:*
dtype0

trial2/dense_4/BiasAddBiasAddtrial2/dense_4/MatMul%trial2/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????
`

Identity_1Identitytrial2/dense_4/BiasAdd*
T0*'
_output_shapes
:?????????

Aplaceholder/trial2/input_layer/preset_embedding/embedding_weightsPlaceholder*
_output_shapes

:*
dtype0*
shape
:
?
AssignVariableOp_11AssignVariableOp5trial2/input_layer/preset_embedding/embedding_weightsAplaceholder/trial2/input_layer/preset_embedding/embedding_weights*
dtype0

ReadVariableOp_11ReadVariableOp5trial2/input_layer/preset_embedding/embedding_weights^AssignVariableOp_11*
_output_shapes

:*
dtype0
r
placeholder/trial2/dense/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
j
AssignVariableOp_12AssignVariableOptrial2/dense/kernelplaceholder/trial2/dense/kernel*
dtype0
|
ReadVariableOp_12ReadVariableOptrial2/dense/kernel^AssignVariableOp_12*
_output_shapes
:	*
dtype0
h
placeholder/trial2/dense/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
f
AssignVariableOp_13AssignVariableOptrial2/dense/biasplaceholder/trial2/dense/bias*
dtype0
v
ReadVariableOp_13ReadVariableOptrial2/dense/bias^AssignVariableOp_13*
_output_shapes	
:*
dtype0
t
!placeholder/trial2/dense_1/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_14AssignVariableOptrial2/dense_1/kernel!placeholder/trial2/dense_1/kernel*
dtype0
~
ReadVariableOp_14ReadVariableOptrial2/dense_1/kernel^AssignVariableOp_14*
_output_shapes
:	*
dtype0
j
placeholder/trial2/dense_1/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_15AssignVariableOptrial2/dense_1/biasplaceholder/trial2/dense_1/bias*
dtype0
x
ReadVariableOp_15ReadVariableOptrial2/dense_1/bias^AssignVariableOp_15*
_output_shapes	
:*
dtype0
v
!placeholder/trial2/dense_2/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_16AssignVariableOptrial2/dense_2/kernel!placeholder/trial2/dense_2/kernel*
dtype0

ReadVariableOp_16ReadVariableOptrial2/dense_2/kernel^AssignVariableOp_16* 
_output_shapes
:
*
dtype0
j
placeholder/trial2/dense_2/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_17AssignVariableOptrial2/dense_2/biasplaceholder/trial2/dense_2/bias*
dtype0
x
ReadVariableOp_17ReadVariableOptrial2/dense_2/bias^AssignVariableOp_17*
_output_shapes	
:*
dtype0
v
!placeholder/trial2/dense_3/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_18AssignVariableOptrial2/dense_3/kernel!placeholder/trial2/dense_3/kernel*
dtype0

ReadVariableOp_18ReadVariableOptrial2/dense_3/kernel^AssignVariableOp_18* 
_output_shapes
:
*
dtype0
j
placeholder/trial2/dense_3/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_19AssignVariableOptrial2/dense_3/biasplaceholder/trial2/dense_3/bias*
dtype0
x
ReadVariableOp_19ReadVariableOptrial2/dense_3/bias^AssignVariableOp_19*
_output_shapes	
:*
dtype0
t
!placeholder/trial2/dense_4/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_20AssignVariableOptrial2/dense_4/kernel!placeholder/trial2/dense_4/kernel*
dtype0
~
ReadVariableOp_20ReadVariableOptrial2/dense_4/kernel^AssignVariableOp_20*
_output_shapes
:	*
dtype0
h
placeholder/trial2/dense_4/biasPlaceholder*
_output_shapes
:*
dtype0*
shape:
j
AssignVariableOp_21AssignVariableOptrial2/dense_4/biasplaceholder/trial2/dense_4/bias*
dtype0
w
ReadVariableOp_21ReadVariableOptrial2/dense_4/bias^AssignVariableOp_21*
_output_shapes
:*
dtype0

group_deps_1NoOp^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_20^AssignVariableOp_21
[
Shape_2Shape$transform/transform/strided_slice_41*
T0*
_output_shapes
:
_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 
a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
·
strided_slice_2StridedSliceShape_2strided_slice_2/stackstrided_slice_2/stack_1strided_slice_2/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
s
1trial3/input_layer/preset_embedding/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :

/trial3/input_layer/preset_embedding/num_bucketsCast1trial3/input_layer/preset_embedding/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
l
*trial3/input_layer/preset_embedding/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial3/input_layer/preset_embedding/zeroCast*trial3/input_layer/preset_embedding/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
Ν
(trial3/input_layer/preset_embedding/LessLessCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2(trial3/input_layer/preset_embedding/zero*
T0	*#
_output_shapes
:?????????
δ
0trial3/input_layer/preset_embedding/GreaterEqualGreaterEqualCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2/trial3/input_layer/preset_embedding/num_buckets*
T0	*#
_output_shapes
:?????????
Ύ
0trial3/input_layer/preset_embedding/out_of_range	LogicalOr(trial3/input_layer/preset_embedding/Less0trial3/input_layer/preset_embedding/GreaterEqual*#
_output_shapes
:?????????

)trial3/input_layer/preset_embedding/ShapeShapeCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*
_output_shapes
:
l
*trial3/input_layer/preset_embedding/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial3/input_layer/preset_embedding/CastCast*trial3/input_layer/preset_embedding/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
½
2trial3/input_layer/preset_embedding/default_valuesFill)trial3/input_layer/preset_embedding/Shape(trial3/input_layer/preset_embedding/Cast*
T0	*#
_output_shapes
:?????????

,trial3/input_layer/preset_embedding/SelectV2SelectV20trial3/input_layer/preset_embedding/out_of_range2trial3/input_layer/preset_embedding/default_valuesCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:?????????
σ
Xtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"      
ζ
Wtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
θ
Ytrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *Α>
Ο
btrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Vtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulMulbtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalYtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes

:
ύ
Rtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normalAddVtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulWtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes

:

5trial3/input_layer/preset_embedding/embedding_weightsVarHandleOp*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape
:*F
shared_name75trial3/input_layer/preset_embedding/embedding_weights
»
Vtrial3/input_layer/preset_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOp5trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes
: 
θ
<trial3/input_layer/preset_embedding/embedding_weights/AssignAssignVariableOp5trial3/input_layer/preset_embedding/embedding_weightsRtrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
Ώ
Itrial3/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpReadVariableOp5trial3/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Htrial3/input_layer/preset_embedding/preset_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Gtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Θ
Btrial3/input_layer/preset_embedding/preset_embedding_weights/SliceSlice6transform/transform/inputs/inputs/preset/preset_2_copyHtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice/beginGtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:

Btrial3/input_layer/preset_embedding/preset_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
ς
Atrial3/input_layer/preset_embedding/preset_embedding_weights/ProdProdBtrial3/input_layer/preset_embedding/preset_embedding_weights/SliceBtrial3/input_layer/preset_embedding/preset_embedding_weights/Const*
T0	*
_output_shapes
: 

Mtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :

Jtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
θ
Etrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2GatherV26transform/transform/inputs/inputs/preset/preset_2_copyMtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesJtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Ctrial3/input_layer/preset_embedding/preset_embedding_weights/Cast/xPackAtrial3/input_layer/preset_embedding/preset_embedding_weights/ProdEtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
Δ
Jtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeSparseReshape;transform/transform/SparseFillEmptyRows/SparseFillEmptyRows6transform/transform/inputs/inputs/preset/preset_2_copyCtrial3/input_layer/preset_embedding/preset_embedding_weights/Cast/x*-
_output_shapes
:?????????:
»
Strial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityIdentity,trial3/input_layer/preset_embedding/SelectV2*
T0	*#
_output_shapes
:?????????

Ktrial3/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
Itrial3/input_layer/preset_embedding/preset_embedding_weights/GreaterEqualGreaterEqualStrial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityKtrial3/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
Ώ
Btrial3/input_layer/preset_embedding/preset_embedding_weights/WhereWhereItrial3/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual*'
_output_shapes
:?????????

Jtrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????

Dtrial3/input_layer/preset_embedding/preset_embedding_weights/ReshapeReshapeBtrial3/input_layer/preset_embedding/preset_embedding_weights/WhereJtrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????

Ltrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1GatherV2Jtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeDtrial3/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????

Ltrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2GatherV2Strial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityDtrial3/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
Δ
Etrial3/input_layer/preset_embedding/preset_embedding_weights/IdentityIdentityLtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:

Vtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 

dtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsGtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1Gtrial3/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2Etrial3/input_layer/preset_embedding/preset_embedding_weights/IdentityVtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
Ή
htrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
»
jtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
»
jtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      

btrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicedtrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowshtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackjtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1jtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

[trial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/UniqueUniqueftrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????

etrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGather5trial3/input_layer/preset_embedding/embedding_weights[trial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????*
dtype0
έ
ntrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentityetrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*H
_class>
<:loc:@trial3/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????

ptrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identityntrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*'
_output_shapes
:?????????
β
Ttrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparseSparseSegmentSumptrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1]trial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique:1btrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice*
T0*
Tsegmentids0	*'
_output_shapes
:?????????

Ltrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   
Ή
Ftrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Reshapeftrial3/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2Ltrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
Ζ
Btrial3/input_layer/preset_embedding/preset_embedding_weights/ShapeShapeTtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:

Ptrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Rtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Rtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ή
Jtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_sliceStridedSliceBtrial3/input_layer/preset_embedding/preset_embedding_weights/ShapePtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackRtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Rtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask

Dtrial3/input_layer/preset_embedding/preset_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :

Btrial3/input_layer/preset_embedding/preset_embedding_weights/stackPackDtrial3/input_layer/preset_embedding/preset_embedding_weights/stack/0Jtrial3/input_layer/preset_embedding/preset_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:

Atrial3/input_layer/preset_embedding/preset_embedding_weights/TileTileFtrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Btrial3/input_layer/preset_embedding/preset_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
ά
Gtrial3/input_layer/preset_embedding/preset_embedding_weights/zeros_like	ZerosLikeTtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
Ϊ
<trial3/input_layer/preset_embedding/preset_embedding_weightsSelectAtrial3/input_layer/preset_embedding/preset_embedding_weights/TileGtrial3/input_layer/preset_embedding/preset_embedding_weights/zeros_likeTtrial3/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
·
Ctrial3/input_layer/preset_embedding/preset_embedding_weights/Cast_1Cast6transform/transform/inputs/inputs/preset/preset_2_copy*

DstT0*

SrcT0	*
_output_shapes
:

Jtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Itrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Ϋ
Dtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1SliceCtrial3/input_layer/preset_embedding/preset_embedding_weights/Cast_1Jtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginItrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
°
Dtrial3/input_layer/preset_embedding/preset_embedding_weights/Shape_1Shape<trial3/input_layer/preset_embedding/preset_embedding_weights*
T0*
_output_shapes
:

Jtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:

Itrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
ά
Dtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2SliceDtrial3/input_layer/preset_embedding/preset_embedding_weights/Shape_1Jtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginItrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:

Htrial3/input_layer/preset_embedding/preset_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Σ
Ctrial3/input_layer/preset_embedding/preset_embedding_weights/concatConcatV2Dtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_1Dtrial3/input_layer/preset_embedding/preset_embedding_weights/Slice_2Htrial3/input_layer/preset_embedding/preset_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:

Ftrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_2Reshape<trial3/input_layer/preset_embedding/preset_embedding_weightsCtrial3/input_layer/preset_embedding/preset_embedding_weights/concat*
T0*'
_output_shapes
:?????????
‘
+trial3/input_layer/preset_embedding/Shape_1ShapeFtrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_2*
T0*
_output_shapes
:

7trial3/input_layer/preset_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9trial3/input_layer/preset_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9trial3/input_layer/preset_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
γ
1trial3/input_layer/preset_embedding/strided_sliceStridedSlice+trial3/input_layer/preset_embedding/Shape_17trial3/input_layer/preset_embedding/strided_slice/stack9trial3/input_layer/preset_embedding/strided_slice/stack_19trial3/input_layer/preset_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
u
3trial3/input_layer/preset_embedding/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ο
1trial3/input_layer/preset_embedding/Reshape/shapePack1trial3/input_layer/preset_embedding/strided_slice3trial3/input_layer/preset_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:
γ
+trial3/input_layer/preset_embedding/ReshapeReshapeFtrial3/input_layer/preset_embedding/preset_embedding_weights/Reshape_21trial3/input_layer/preset_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
f
$trial3/input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :

 trial3/input_layer/concat/concatIdentity+trial3/input_layer/preset_embedding/Reshape*
T0*'
_output_shapes
:?????????
\
trial3/ShapeShape trial3/input_layer/concat/concat*
T0*
_output_shapes
:
d
trial3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
f
trial3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
trial3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Π
trial3/strided_sliceStridedSlicetrial3/Shapetrial3/strided_slice/stacktrial3/strided_slice/stack_1trial3/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
Y
trial3/CastCasttrial3/strided_slice*

DstT0*

SrcT0*
_output_shapes
: 
]
trial3/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

trial3/concatConcatV2 trial3/input_layer/concat/concat$transform/transform/strided_slice_58$transform/transform/strided_slice_59$transform/transform/strided_slice_48$transform/transform/strided_slice_49$transform/transform/strided_slice_50$transform/transform/strided_slice_51$transform/transform/strided_slice_44$transform/transform/strided_slice_45$transform/transform/strided_slice_40$transform/transform/strided_slice_41$transform/transform/strided_slice_42$transform/transform/strided_slice_43$transform/transform/strided_slice_46$transform/transform/strided_slice_47$transform/transform/strided_slice_52$transform/transform/strided_slice_53$transform/transform/strided_slice_56$transform/transform/strided_slice_57$transform/transform/strided_slice_54$transform/transform/strided_slice_55trial3/concat/axis*
N*
T0*'
_output_shapes
:?????????
­
4trial3/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@trial3/dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

2trial3/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@trial3/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ

2trial3/dense/kernel/Initializer/random_uniform/maxConst*&
_class
loc:@trial3/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
β
<trial3/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4trial3/dense/kernel/Initializer/random_uniform/shape*
T0*&
_class
loc:@trial3/dense/kernel*
_output_shapes
:	*
dtype0
κ
2trial3/dense/kernel/Initializer/random_uniform/subSub2trial3/dense/kernel/Initializer/random_uniform/max2trial3/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial3/dense/kernel*
_output_shapes
: 
ύ
2trial3/dense/kernel/Initializer/random_uniform/mulMul<trial3/dense/kernel/Initializer/random_uniform/RandomUniform2trial3/dense/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@trial3/dense/kernel*
_output_shapes
:	
ο
.trial3/dense/kernel/Initializer/random_uniformAdd2trial3/dense/kernel/Initializer/random_uniform/mul2trial3/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial3/dense/kernel*
_output_shapes
:	
«
trial3/dense/kernelVarHandleOp*&
_class
loc:@trial3/dense/kernel*
_output_shapes
: *
dtype0*
shape:	*$
shared_nametrial3/dense/kernel
w
4trial3/dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense/kernel*
_output_shapes
: 

trial3/dense/kernel/AssignAssignVariableOptrial3/dense/kernel.trial3/dense/kernel/Initializer/random_uniform*
dtype0
|
'trial3/dense/kernel/Read/ReadVariableOpReadVariableOptrial3/dense/kernel*
_output_shapes
:	*
dtype0

#trial3/dense/bias/Initializer/zerosConst*$
_class
loc:@trial3/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
‘
trial3/dense/biasVarHandleOp*$
_class
loc:@trial3/dense/bias*
_output_shapes
: *
dtype0*
shape:*"
shared_nametrial3/dense/bias
s
2trial3/dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense/bias*
_output_shapes
: 
q
trial3/dense/bias/AssignAssignVariableOptrial3/dense/bias#trial3/dense/bias/Initializer/zeros*
dtype0
t
%trial3/dense/bias/Read/ReadVariableOpReadVariableOptrial3/dense/bias*
_output_shapes	
:*
dtype0
w
"trial3/dense/MatMul/ReadVariableOpReadVariableOptrial3/dense/kernel*
_output_shapes
:	*
dtype0

trial3/dense/MatMulMatMultrial3/concat"trial3/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
r
#trial3/dense/BiasAdd/ReadVariableOpReadVariableOptrial3/dense/bias*
_output_shapes	
:*
dtype0

trial3/dense/BiasAddBiasAddtrial3/dense/MatMul#trial3/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
\
trial3/ReluRelutrial3/dense/BiasAdd*
T0*(
_output_shapes
:?????????
c
trial3/dropout/IdentityIdentitytrial3/Relu*
T0*(
_output_shapes
:?????????
±
6trial3/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial3/dense_1/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ
£
4trial3/dense_1/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
θ
>trial3/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial3/dense_1/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
:	*
dtype0
ς
4trial3/dense_1/kernel/Initializer/random_uniform/subSub4trial3/dense_1/kernel/Initializer/random_uniform/max4trial3/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
: 

4trial3/dense_1/kernel/Initializer/random_uniform/mulMul>trial3/dense_1/kernel/Initializer/random_uniform/RandomUniform4trial3/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
:	
χ
0trial3/dense_1/kernel/Initializer/random_uniformAdd4trial3/dense_1/kernel/Initializer/random_uniform/mul4trial3/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
:	
±
trial3/dense_1/kernelVarHandleOp*(
_class
loc:@trial3/dense_1/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial3/dense_1/kernel
{
6trial3/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_1/kernel*
_output_shapes
: 

trial3/dense_1/kernel/AssignAssignVariableOptrial3/dense_1/kernel0trial3/dense_1/kernel/Initializer/random_uniform*
dtype0

)trial3/dense_1/kernel/Read/ReadVariableOpReadVariableOptrial3/dense_1/kernel*
_output_shapes
:	*
dtype0

%trial3/dense_1/bias/Initializer/zerosConst*&
_class
loc:@trial3/dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
trial3/dense_1/biasVarHandleOp*&
_class
loc:@trial3/dense_1/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial3/dense_1/bias
w
4trial3/dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_1/bias*
_output_shapes
: 
w
trial3/dense_1/bias/AssignAssignVariableOptrial3/dense_1/bias%trial3/dense_1/bias/Initializer/zeros*
dtype0
x
'trial3/dense_1/bias/Read/ReadVariableOpReadVariableOptrial3/dense_1/bias*
_output_shapes	
:*
dtype0
{
$trial3/dense_1/MatMul/ReadVariableOpReadVariableOptrial3/dense_1/kernel*
_output_shapes
:	*
dtype0

trial3/dense_1/MatMulMatMultrial3/concat$trial3/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial3/dense_1/BiasAdd/ReadVariableOpReadVariableOptrial3/dense_1/bias*
_output_shapes	
:*
dtype0

trial3/dense_1/BiasAddBiasAddtrial3/dense_1/MatMul%trial3/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
w

trial3/addAddV2trial3/dropout/Identitytrial3/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial3/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial3/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial3/dense_2/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial3/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial3/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial3/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial3/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial3/dense_2/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial3/dense_2/kernel* 
_output_shapes
:
*
dtype0
ς
4trial3/dense_2/kernel/Initializer/random_uniform/subSub4trial3/dense_2/kernel/Initializer/random_uniform/max4trial3/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_2/kernel*
_output_shapes
: 

4trial3/dense_2/kernel/Initializer/random_uniform/mulMul>trial3/dense_2/kernel/Initializer/random_uniform/RandomUniform4trial3/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial3/dense_2/kernel* 
_output_shapes
:

ψ
0trial3/dense_2/kernel/Initializer/random_uniformAdd4trial3/dense_2/kernel/Initializer/random_uniform/mul4trial3/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_2/kernel* 
_output_shapes
:

²
trial3/dense_2/kernelVarHandleOp*(
_class
loc:@trial3/dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial3/dense_2/kernel
{
6trial3/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_2/kernel*
_output_shapes
: 

trial3/dense_2/kernel/AssignAssignVariableOptrial3/dense_2/kernel0trial3/dense_2/kernel/Initializer/random_uniform*
dtype0

)trial3/dense_2/kernel/Read/ReadVariableOpReadVariableOptrial3/dense_2/kernel* 
_output_shapes
:
*
dtype0
¨
5trial3/dense_2/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial3/dense_2/bias*
_output_shapes
:*
dtype0*
valueB:

+trial3/dense_2/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial3/dense_2/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial3/dense_2/bias/Initializer/zerosFill5trial3/dense_2/bias/Initializer/zeros/shape_as_tensor+trial3/dense_2/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial3/dense_2/bias*
_output_shapes	
:
§
trial3/dense_2/biasVarHandleOp*&
_class
loc:@trial3/dense_2/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial3/dense_2/bias
w
4trial3/dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_2/bias*
_output_shapes
: 
w
trial3/dense_2/bias/AssignAssignVariableOptrial3/dense_2/bias%trial3/dense_2/bias/Initializer/zeros*
dtype0
x
'trial3/dense_2/bias/Read/ReadVariableOpReadVariableOptrial3/dense_2/bias*
_output_shapes	
:*
dtype0
|
$trial3/dense_2/MatMul/ReadVariableOpReadVariableOptrial3/dense_2/kernel* 
_output_shapes
:
*
dtype0

trial3/dense_2/MatMulMatMul
trial3/add$trial3/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial3/dense_2/BiasAdd/ReadVariableOpReadVariableOptrial3/dense_2/bias*
_output_shapes	
:*
dtype0

trial3/dense_2/BiasAddBiasAddtrial3/dense_2/MatMul%trial3/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
`
trial3/Relu_1Relutrial3/dense_2/BiasAdd*
T0*(
_output_shapes
:?????????
g
trial3/dropout_1/IdentityIdentitytrial3/Relu_1*
T0*(
_output_shapes
:?????????
±
6trial3/dense_3/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial3/dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial3/dense_3/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial3/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial3/dense_3/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial3/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial3/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial3/dense_3/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial3/dense_3/kernel* 
_output_shapes
:
*
dtype0
ς
4trial3/dense_3/kernel/Initializer/random_uniform/subSub4trial3/dense_3/kernel/Initializer/random_uniform/max4trial3/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_3/kernel*
_output_shapes
: 

4trial3/dense_3/kernel/Initializer/random_uniform/mulMul>trial3/dense_3/kernel/Initializer/random_uniform/RandomUniform4trial3/dense_3/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial3/dense_3/kernel* 
_output_shapes
:

ψ
0trial3/dense_3/kernel/Initializer/random_uniformAdd4trial3/dense_3/kernel/Initializer/random_uniform/mul4trial3/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_3/kernel* 
_output_shapes
:

²
trial3/dense_3/kernelVarHandleOp*(
_class
loc:@trial3/dense_3/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial3/dense_3/kernel
{
6trial3/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_3/kernel*
_output_shapes
: 

trial3/dense_3/kernel/AssignAssignVariableOptrial3/dense_3/kernel0trial3/dense_3/kernel/Initializer/random_uniform*
dtype0

)trial3/dense_3/kernel/Read/ReadVariableOpReadVariableOptrial3/dense_3/kernel* 
_output_shapes
:
*
dtype0
¨
5trial3/dense_3/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial3/dense_3/bias*
_output_shapes
:*
dtype0*
valueB:

+trial3/dense_3/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial3/dense_3/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial3/dense_3/bias/Initializer/zerosFill5trial3/dense_3/bias/Initializer/zeros/shape_as_tensor+trial3/dense_3/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial3/dense_3/bias*
_output_shapes	
:
§
trial3/dense_3/biasVarHandleOp*&
_class
loc:@trial3/dense_3/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial3/dense_3/bias
w
4trial3/dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_3/bias*
_output_shapes
: 
w
trial3/dense_3/bias/AssignAssignVariableOptrial3/dense_3/bias%trial3/dense_3/bias/Initializer/zeros*
dtype0
x
'trial3/dense_3/bias/Read/ReadVariableOpReadVariableOptrial3/dense_3/bias*
_output_shapes	
:*
dtype0
|
$trial3/dense_3/MatMul/ReadVariableOpReadVariableOptrial3/dense_3/kernel* 
_output_shapes
:
*
dtype0

trial3/dense_3/MatMulMatMul
trial3/add$trial3/dense_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial3/dense_3/BiasAdd/ReadVariableOpReadVariableOptrial3/dense_3/bias*
_output_shapes	
:*
dtype0

trial3/dense_3/BiasAddBiasAddtrial3/dense_3/MatMul%trial3/dense_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
{
trial3/add_1AddV2trial3/dropout_1/Identitytrial3/dense_3/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial3/dense_4/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial3/dense_4/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°½
£
4trial3/dense_4/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°=
θ
>trial3/dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial3/dense_4/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
:	*
dtype0
ς
4trial3/dense_4/kernel/Initializer/random_uniform/subSub4trial3/dense_4/kernel/Initializer/random_uniform/max4trial3/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
: 

4trial3/dense_4/kernel/Initializer/random_uniform/mulMul>trial3/dense_4/kernel/Initializer/random_uniform/RandomUniform4trial3/dense_4/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
:	
χ
0trial3/dense_4/kernel/Initializer/random_uniformAdd4trial3/dense_4/kernel/Initializer/random_uniform/mul4trial3/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
:	
±
trial3/dense_4/kernelVarHandleOp*(
_class
loc:@trial3/dense_4/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial3/dense_4/kernel
{
6trial3/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_4/kernel*
_output_shapes
: 

trial3/dense_4/kernel/AssignAssignVariableOptrial3/dense_4/kernel0trial3/dense_4/kernel/Initializer/random_uniform*
dtype0

)trial3/dense_4/kernel/Read/ReadVariableOpReadVariableOptrial3/dense_4/kernel*
_output_shapes
:	*
dtype0

%trial3/dense_4/bias/Initializer/zerosConst*&
_class
loc:@trial3/dense_4/bias*
_output_shapes
:*
dtype0*
valueB*    
¦
trial3/dense_4/biasVarHandleOp*&
_class
loc:@trial3/dense_4/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial3/dense_4/bias
w
4trial3/dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial3/dense_4/bias*
_output_shapes
: 
w
trial3/dense_4/bias/AssignAssignVariableOptrial3/dense_4/bias%trial3/dense_4/bias/Initializer/zeros*
dtype0
w
'trial3/dense_4/bias/Read/ReadVariableOpReadVariableOptrial3/dense_4/bias*
_output_shapes
:*
dtype0
{
$trial3/dense_4/MatMul/ReadVariableOpReadVariableOptrial3/dense_4/kernel*
_output_shapes
:	*
dtype0

trial3/dense_4/MatMulMatMultrial3/add_1$trial3/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
u
%trial3/dense_4/BiasAdd/ReadVariableOpReadVariableOptrial3/dense_4/bias*
_output_shapes
:*
dtype0

trial3/dense_4/BiasAddBiasAddtrial3/dense_4/MatMul%trial3/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????
`

Identity_2Identitytrial3/dense_4/BiasAdd*
T0*'
_output_shapes
:?????????

Aplaceholder/trial3/input_layer/preset_embedding/embedding_weightsPlaceholder*
_output_shapes

:*
dtype0*
shape
:
?
AssignVariableOp_22AssignVariableOp5trial3/input_layer/preset_embedding/embedding_weightsAplaceholder/trial3/input_layer/preset_embedding/embedding_weights*
dtype0

ReadVariableOp_22ReadVariableOp5trial3/input_layer/preset_embedding/embedding_weights^AssignVariableOp_22*
_output_shapes

:*
dtype0
r
placeholder/trial3/dense/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
j
AssignVariableOp_23AssignVariableOptrial3/dense/kernelplaceholder/trial3/dense/kernel*
dtype0
|
ReadVariableOp_23ReadVariableOptrial3/dense/kernel^AssignVariableOp_23*
_output_shapes
:	*
dtype0
h
placeholder/trial3/dense/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
f
AssignVariableOp_24AssignVariableOptrial3/dense/biasplaceholder/trial3/dense/bias*
dtype0
v
ReadVariableOp_24ReadVariableOptrial3/dense/bias^AssignVariableOp_24*
_output_shapes	
:*
dtype0
t
!placeholder/trial3/dense_1/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_25AssignVariableOptrial3/dense_1/kernel!placeholder/trial3/dense_1/kernel*
dtype0
~
ReadVariableOp_25ReadVariableOptrial3/dense_1/kernel^AssignVariableOp_25*
_output_shapes
:	*
dtype0
j
placeholder/trial3/dense_1/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_26AssignVariableOptrial3/dense_1/biasplaceholder/trial3/dense_1/bias*
dtype0
x
ReadVariableOp_26ReadVariableOptrial3/dense_1/bias^AssignVariableOp_26*
_output_shapes	
:*
dtype0
v
!placeholder/trial3/dense_2/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_27AssignVariableOptrial3/dense_2/kernel!placeholder/trial3/dense_2/kernel*
dtype0

ReadVariableOp_27ReadVariableOptrial3/dense_2/kernel^AssignVariableOp_27* 
_output_shapes
:
*
dtype0
j
placeholder/trial3/dense_2/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_28AssignVariableOptrial3/dense_2/biasplaceholder/trial3/dense_2/bias*
dtype0
x
ReadVariableOp_28ReadVariableOptrial3/dense_2/bias^AssignVariableOp_28*
_output_shapes	
:*
dtype0
v
!placeholder/trial3/dense_3/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_29AssignVariableOptrial3/dense_3/kernel!placeholder/trial3/dense_3/kernel*
dtype0

ReadVariableOp_29ReadVariableOptrial3/dense_3/kernel^AssignVariableOp_29* 
_output_shapes
:
*
dtype0
j
placeholder/trial3/dense_3/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_30AssignVariableOptrial3/dense_3/biasplaceholder/trial3/dense_3/bias*
dtype0
x
ReadVariableOp_30ReadVariableOptrial3/dense_3/bias^AssignVariableOp_30*
_output_shapes	
:*
dtype0
t
!placeholder/trial3/dense_4/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_31AssignVariableOptrial3/dense_4/kernel!placeholder/trial3/dense_4/kernel*
dtype0
~
ReadVariableOp_31ReadVariableOptrial3/dense_4/kernel^AssignVariableOp_31*
_output_shapes
:	*
dtype0
h
placeholder/trial3/dense_4/biasPlaceholder*
_output_shapes
:*
dtype0*
shape:
j
AssignVariableOp_32AssignVariableOptrial3/dense_4/biasplaceholder/trial3/dense_4/bias*
dtype0
w
ReadVariableOp_32ReadVariableOptrial3/dense_4/bias^AssignVariableOp_32*
_output_shapes
:*
dtype0

group_deps_2NoOp^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32
[
Shape_3Shape$transform/transform/strided_slice_41*
T0*
_output_shapes
:
_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 
a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
·
strided_slice_3StridedSliceShape_3strided_slice_3/stackstrided_slice_3/stack_1strided_slice_3/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
s
1trial4/input_layer/preset_embedding/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :

/trial4/input_layer/preset_embedding/num_bucketsCast1trial4/input_layer/preset_embedding/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
l
*trial4/input_layer/preset_embedding/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial4/input_layer/preset_embedding/zeroCast*trial4/input_layer/preset_embedding/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
Ν
(trial4/input_layer/preset_embedding/LessLessCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2(trial4/input_layer/preset_embedding/zero*
T0	*#
_output_shapes
:?????????
δ
0trial4/input_layer/preset_embedding/GreaterEqualGreaterEqualCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2/trial4/input_layer/preset_embedding/num_buckets*
T0	*#
_output_shapes
:?????????
Ύ
0trial4/input_layer/preset_embedding/out_of_range	LogicalOr(trial4/input_layer/preset_embedding/Less0trial4/input_layer/preset_embedding/GreaterEqual*#
_output_shapes
:?????????

)trial4/input_layer/preset_embedding/ShapeShapeCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*
_output_shapes
:
l
*trial4/input_layer/preset_embedding/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial4/input_layer/preset_embedding/CastCast*trial4/input_layer/preset_embedding/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
½
2trial4/input_layer/preset_embedding/default_valuesFill)trial4/input_layer/preset_embedding/Shape(trial4/input_layer/preset_embedding/Cast*
T0	*#
_output_shapes
:?????????

,trial4/input_layer/preset_embedding/SelectV2SelectV20trial4/input_layer/preset_embedding/out_of_range2trial4/input_layer/preset_embedding/default_valuesCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:?????????
σ
Xtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"      
ζ
Wtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
θ
Ytrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *Α>
Ο
btrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Vtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulMulbtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalYtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes

:
ύ
Rtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normalAddVtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulWtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes

:

5trial4/input_layer/preset_embedding/embedding_weightsVarHandleOp*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape
:*F
shared_name75trial4/input_layer/preset_embedding/embedding_weights
»
Vtrial4/input_layer/preset_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOp5trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes
: 
θ
<trial4/input_layer/preset_embedding/embedding_weights/AssignAssignVariableOp5trial4/input_layer/preset_embedding/embedding_weightsRtrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
Ώ
Itrial4/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpReadVariableOp5trial4/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Htrial4/input_layer/preset_embedding/preset_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Gtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Θ
Btrial4/input_layer/preset_embedding/preset_embedding_weights/SliceSlice6transform/transform/inputs/inputs/preset/preset_2_copyHtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice/beginGtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:

Btrial4/input_layer/preset_embedding/preset_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
ς
Atrial4/input_layer/preset_embedding/preset_embedding_weights/ProdProdBtrial4/input_layer/preset_embedding/preset_embedding_weights/SliceBtrial4/input_layer/preset_embedding/preset_embedding_weights/Const*
T0	*
_output_shapes
: 

Mtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :

Jtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
θ
Etrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2GatherV26transform/transform/inputs/inputs/preset/preset_2_copyMtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesJtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Ctrial4/input_layer/preset_embedding/preset_embedding_weights/Cast/xPackAtrial4/input_layer/preset_embedding/preset_embedding_weights/ProdEtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
Δ
Jtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeSparseReshape;transform/transform/SparseFillEmptyRows/SparseFillEmptyRows6transform/transform/inputs/inputs/preset/preset_2_copyCtrial4/input_layer/preset_embedding/preset_embedding_weights/Cast/x*-
_output_shapes
:?????????:
»
Strial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityIdentity,trial4/input_layer/preset_embedding/SelectV2*
T0	*#
_output_shapes
:?????????

Ktrial4/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
Itrial4/input_layer/preset_embedding/preset_embedding_weights/GreaterEqualGreaterEqualStrial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityKtrial4/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
Ώ
Btrial4/input_layer/preset_embedding/preset_embedding_weights/WhereWhereItrial4/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual*'
_output_shapes
:?????????

Jtrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????

Dtrial4/input_layer/preset_embedding/preset_embedding_weights/ReshapeReshapeBtrial4/input_layer/preset_embedding/preset_embedding_weights/WhereJtrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????

Ltrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1GatherV2Jtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeDtrial4/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????

Ltrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2GatherV2Strial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityDtrial4/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
Δ
Etrial4/input_layer/preset_embedding/preset_embedding_weights/IdentityIdentityLtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:

Vtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 

dtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsGtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1Gtrial4/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2Etrial4/input_layer/preset_embedding/preset_embedding_weights/IdentityVtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
Ή
htrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
»
jtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
»
jtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      

btrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicedtrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowshtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackjtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1jtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

[trial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/UniqueUniqueftrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????

etrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGather5trial4/input_layer/preset_embedding/embedding_weights[trial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????*
dtype0
έ
ntrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentityetrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*H
_class>
<:loc:@trial4/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????

ptrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identityntrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*'
_output_shapes
:?????????
β
Ttrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparseSparseSegmentSumptrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1]trial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique:1btrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice*
T0*
Tsegmentids0	*'
_output_shapes
:?????????

Ltrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   
Ή
Ftrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Reshapeftrial4/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2Ltrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
Ζ
Btrial4/input_layer/preset_embedding/preset_embedding_weights/ShapeShapeTtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:

Ptrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Rtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Rtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ή
Jtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_sliceStridedSliceBtrial4/input_layer/preset_embedding/preset_embedding_weights/ShapePtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackRtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Rtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask

Dtrial4/input_layer/preset_embedding/preset_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :

Btrial4/input_layer/preset_embedding/preset_embedding_weights/stackPackDtrial4/input_layer/preset_embedding/preset_embedding_weights/stack/0Jtrial4/input_layer/preset_embedding/preset_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:

Atrial4/input_layer/preset_embedding/preset_embedding_weights/TileTileFtrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Btrial4/input_layer/preset_embedding/preset_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
ά
Gtrial4/input_layer/preset_embedding/preset_embedding_weights/zeros_like	ZerosLikeTtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
Ϊ
<trial4/input_layer/preset_embedding/preset_embedding_weightsSelectAtrial4/input_layer/preset_embedding/preset_embedding_weights/TileGtrial4/input_layer/preset_embedding/preset_embedding_weights/zeros_likeTtrial4/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
·
Ctrial4/input_layer/preset_embedding/preset_embedding_weights/Cast_1Cast6transform/transform/inputs/inputs/preset/preset_2_copy*

DstT0*

SrcT0	*
_output_shapes
:

Jtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Itrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Ϋ
Dtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1SliceCtrial4/input_layer/preset_embedding/preset_embedding_weights/Cast_1Jtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginItrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
°
Dtrial4/input_layer/preset_embedding/preset_embedding_weights/Shape_1Shape<trial4/input_layer/preset_embedding/preset_embedding_weights*
T0*
_output_shapes
:

Jtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:

Itrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
ά
Dtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2SliceDtrial4/input_layer/preset_embedding/preset_embedding_weights/Shape_1Jtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginItrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:

Htrial4/input_layer/preset_embedding/preset_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Σ
Ctrial4/input_layer/preset_embedding/preset_embedding_weights/concatConcatV2Dtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_1Dtrial4/input_layer/preset_embedding/preset_embedding_weights/Slice_2Htrial4/input_layer/preset_embedding/preset_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:

Ftrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_2Reshape<trial4/input_layer/preset_embedding/preset_embedding_weightsCtrial4/input_layer/preset_embedding/preset_embedding_weights/concat*
T0*'
_output_shapes
:?????????
‘
+trial4/input_layer/preset_embedding/Shape_1ShapeFtrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_2*
T0*
_output_shapes
:

7trial4/input_layer/preset_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9trial4/input_layer/preset_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9trial4/input_layer/preset_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
γ
1trial4/input_layer/preset_embedding/strided_sliceStridedSlice+trial4/input_layer/preset_embedding/Shape_17trial4/input_layer/preset_embedding/strided_slice/stack9trial4/input_layer/preset_embedding/strided_slice/stack_19trial4/input_layer/preset_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
u
3trial4/input_layer/preset_embedding/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ο
1trial4/input_layer/preset_embedding/Reshape/shapePack1trial4/input_layer/preset_embedding/strided_slice3trial4/input_layer/preset_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:
γ
+trial4/input_layer/preset_embedding/ReshapeReshapeFtrial4/input_layer/preset_embedding/preset_embedding_weights/Reshape_21trial4/input_layer/preset_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
f
$trial4/input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :

 trial4/input_layer/concat/concatIdentity+trial4/input_layer/preset_embedding/Reshape*
T0*'
_output_shapes
:?????????
\
trial4/ShapeShape trial4/input_layer/concat/concat*
T0*
_output_shapes
:
d
trial4/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
f
trial4/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
trial4/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Π
trial4/strided_sliceStridedSlicetrial4/Shapetrial4/strided_slice/stacktrial4/strided_slice/stack_1trial4/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
Y
trial4/CastCasttrial4/strided_slice*

DstT0*

SrcT0*
_output_shapes
: 
]
trial4/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

trial4/concatConcatV2 trial4/input_layer/concat/concat$transform/transform/strided_slice_58$transform/transform/strided_slice_59$transform/transform/strided_slice_48$transform/transform/strided_slice_49$transform/transform/strided_slice_50$transform/transform/strided_slice_51$transform/transform/strided_slice_44$transform/transform/strided_slice_45$transform/transform/strided_slice_40$transform/transform/strided_slice_41$transform/transform/strided_slice_42$transform/transform/strided_slice_43$transform/transform/strided_slice_46$transform/transform/strided_slice_47$transform/transform/strided_slice_52$transform/transform/strided_slice_53$transform/transform/strided_slice_56$transform/transform/strided_slice_57$transform/transform/strided_slice_54$transform/transform/strided_slice_55trial4/concat/axis*
N*
T0*'
_output_shapes
:?????????
­
4trial4/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@trial4/dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

2trial4/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@trial4/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ

2trial4/dense/kernel/Initializer/random_uniform/maxConst*&
_class
loc:@trial4/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
β
<trial4/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4trial4/dense/kernel/Initializer/random_uniform/shape*
T0*&
_class
loc:@trial4/dense/kernel*
_output_shapes
:	*
dtype0
κ
2trial4/dense/kernel/Initializer/random_uniform/subSub2trial4/dense/kernel/Initializer/random_uniform/max2trial4/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial4/dense/kernel*
_output_shapes
: 
ύ
2trial4/dense/kernel/Initializer/random_uniform/mulMul<trial4/dense/kernel/Initializer/random_uniform/RandomUniform2trial4/dense/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@trial4/dense/kernel*
_output_shapes
:	
ο
.trial4/dense/kernel/Initializer/random_uniformAdd2trial4/dense/kernel/Initializer/random_uniform/mul2trial4/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial4/dense/kernel*
_output_shapes
:	
«
trial4/dense/kernelVarHandleOp*&
_class
loc:@trial4/dense/kernel*
_output_shapes
: *
dtype0*
shape:	*$
shared_nametrial4/dense/kernel
w
4trial4/dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense/kernel*
_output_shapes
: 

trial4/dense/kernel/AssignAssignVariableOptrial4/dense/kernel.trial4/dense/kernel/Initializer/random_uniform*
dtype0
|
'trial4/dense/kernel/Read/ReadVariableOpReadVariableOptrial4/dense/kernel*
_output_shapes
:	*
dtype0

#trial4/dense/bias/Initializer/zerosConst*$
_class
loc:@trial4/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
‘
trial4/dense/biasVarHandleOp*$
_class
loc:@trial4/dense/bias*
_output_shapes
: *
dtype0*
shape:*"
shared_nametrial4/dense/bias
s
2trial4/dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense/bias*
_output_shapes
: 
q
trial4/dense/bias/AssignAssignVariableOptrial4/dense/bias#trial4/dense/bias/Initializer/zeros*
dtype0
t
%trial4/dense/bias/Read/ReadVariableOpReadVariableOptrial4/dense/bias*
_output_shapes	
:*
dtype0
w
"trial4/dense/MatMul/ReadVariableOpReadVariableOptrial4/dense/kernel*
_output_shapes
:	*
dtype0

trial4/dense/MatMulMatMultrial4/concat"trial4/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
r
#trial4/dense/BiasAdd/ReadVariableOpReadVariableOptrial4/dense/bias*
_output_shapes	
:*
dtype0

trial4/dense/BiasAddBiasAddtrial4/dense/MatMul#trial4/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
\
trial4/ReluRelutrial4/dense/BiasAdd*
T0*(
_output_shapes
:?????????
c
trial4/dropout/IdentityIdentitytrial4/Relu*
T0*(
_output_shapes
:?????????
±
6trial4/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial4/dense_1/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ
£
4trial4/dense_1/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
θ
>trial4/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial4/dense_1/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
:	*
dtype0
ς
4trial4/dense_1/kernel/Initializer/random_uniform/subSub4trial4/dense_1/kernel/Initializer/random_uniform/max4trial4/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
: 

4trial4/dense_1/kernel/Initializer/random_uniform/mulMul>trial4/dense_1/kernel/Initializer/random_uniform/RandomUniform4trial4/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
:	
χ
0trial4/dense_1/kernel/Initializer/random_uniformAdd4trial4/dense_1/kernel/Initializer/random_uniform/mul4trial4/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
:	
±
trial4/dense_1/kernelVarHandleOp*(
_class
loc:@trial4/dense_1/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial4/dense_1/kernel
{
6trial4/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_1/kernel*
_output_shapes
: 

trial4/dense_1/kernel/AssignAssignVariableOptrial4/dense_1/kernel0trial4/dense_1/kernel/Initializer/random_uniform*
dtype0

)trial4/dense_1/kernel/Read/ReadVariableOpReadVariableOptrial4/dense_1/kernel*
_output_shapes
:	*
dtype0

%trial4/dense_1/bias/Initializer/zerosConst*&
_class
loc:@trial4/dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
trial4/dense_1/biasVarHandleOp*&
_class
loc:@trial4/dense_1/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial4/dense_1/bias
w
4trial4/dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_1/bias*
_output_shapes
: 
w
trial4/dense_1/bias/AssignAssignVariableOptrial4/dense_1/bias%trial4/dense_1/bias/Initializer/zeros*
dtype0
x
'trial4/dense_1/bias/Read/ReadVariableOpReadVariableOptrial4/dense_1/bias*
_output_shapes	
:*
dtype0
{
$trial4/dense_1/MatMul/ReadVariableOpReadVariableOptrial4/dense_1/kernel*
_output_shapes
:	*
dtype0

trial4/dense_1/MatMulMatMultrial4/concat$trial4/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial4/dense_1/BiasAdd/ReadVariableOpReadVariableOptrial4/dense_1/bias*
_output_shapes	
:*
dtype0

trial4/dense_1/BiasAddBiasAddtrial4/dense_1/MatMul%trial4/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
w

trial4/addAddV2trial4/dropout/Identitytrial4/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial4/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial4/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial4/dense_2/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial4/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial4/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial4/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial4/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial4/dense_2/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial4/dense_2/kernel* 
_output_shapes
:
*
dtype0
ς
4trial4/dense_2/kernel/Initializer/random_uniform/subSub4trial4/dense_2/kernel/Initializer/random_uniform/max4trial4/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_2/kernel*
_output_shapes
: 

4trial4/dense_2/kernel/Initializer/random_uniform/mulMul>trial4/dense_2/kernel/Initializer/random_uniform/RandomUniform4trial4/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial4/dense_2/kernel* 
_output_shapes
:

ψ
0trial4/dense_2/kernel/Initializer/random_uniformAdd4trial4/dense_2/kernel/Initializer/random_uniform/mul4trial4/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_2/kernel* 
_output_shapes
:

²
trial4/dense_2/kernelVarHandleOp*(
_class
loc:@trial4/dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial4/dense_2/kernel
{
6trial4/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_2/kernel*
_output_shapes
: 

trial4/dense_2/kernel/AssignAssignVariableOptrial4/dense_2/kernel0trial4/dense_2/kernel/Initializer/random_uniform*
dtype0

)trial4/dense_2/kernel/Read/ReadVariableOpReadVariableOptrial4/dense_2/kernel* 
_output_shapes
:
*
dtype0
¨
5trial4/dense_2/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial4/dense_2/bias*
_output_shapes
:*
dtype0*
valueB:

+trial4/dense_2/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial4/dense_2/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial4/dense_2/bias/Initializer/zerosFill5trial4/dense_2/bias/Initializer/zeros/shape_as_tensor+trial4/dense_2/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial4/dense_2/bias*
_output_shapes	
:
§
trial4/dense_2/biasVarHandleOp*&
_class
loc:@trial4/dense_2/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial4/dense_2/bias
w
4trial4/dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_2/bias*
_output_shapes
: 
w
trial4/dense_2/bias/AssignAssignVariableOptrial4/dense_2/bias%trial4/dense_2/bias/Initializer/zeros*
dtype0
x
'trial4/dense_2/bias/Read/ReadVariableOpReadVariableOptrial4/dense_2/bias*
_output_shapes	
:*
dtype0
|
$trial4/dense_2/MatMul/ReadVariableOpReadVariableOptrial4/dense_2/kernel* 
_output_shapes
:
*
dtype0

trial4/dense_2/MatMulMatMul
trial4/add$trial4/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial4/dense_2/BiasAdd/ReadVariableOpReadVariableOptrial4/dense_2/bias*
_output_shapes	
:*
dtype0

trial4/dense_2/BiasAddBiasAddtrial4/dense_2/MatMul%trial4/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
`
trial4/Relu_1Relutrial4/dense_2/BiasAdd*
T0*(
_output_shapes
:?????????
g
trial4/dropout_1/IdentityIdentitytrial4/Relu_1*
T0*(
_output_shapes
:?????????
±
6trial4/dense_3/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial4/dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial4/dense_3/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial4/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial4/dense_3/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial4/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial4/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial4/dense_3/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial4/dense_3/kernel* 
_output_shapes
:
*
dtype0
ς
4trial4/dense_3/kernel/Initializer/random_uniform/subSub4trial4/dense_3/kernel/Initializer/random_uniform/max4trial4/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_3/kernel*
_output_shapes
: 

4trial4/dense_3/kernel/Initializer/random_uniform/mulMul>trial4/dense_3/kernel/Initializer/random_uniform/RandomUniform4trial4/dense_3/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial4/dense_3/kernel* 
_output_shapes
:

ψ
0trial4/dense_3/kernel/Initializer/random_uniformAdd4trial4/dense_3/kernel/Initializer/random_uniform/mul4trial4/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_3/kernel* 
_output_shapes
:

²
trial4/dense_3/kernelVarHandleOp*(
_class
loc:@trial4/dense_3/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial4/dense_3/kernel
{
6trial4/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_3/kernel*
_output_shapes
: 

trial4/dense_3/kernel/AssignAssignVariableOptrial4/dense_3/kernel0trial4/dense_3/kernel/Initializer/random_uniform*
dtype0

)trial4/dense_3/kernel/Read/ReadVariableOpReadVariableOptrial4/dense_3/kernel* 
_output_shapes
:
*
dtype0
¨
5trial4/dense_3/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial4/dense_3/bias*
_output_shapes
:*
dtype0*
valueB:

+trial4/dense_3/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial4/dense_3/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial4/dense_3/bias/Initializer/zerosFill5trial4/dense_3/bias/Initializer/zeros/shape_as_tensor+trial4/dense_3/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial4/dense_3/bias*
_output_shapes	
:
§
trial4/dense_3/biasVarHandleOp*&
_class
loc:@trial4/dense_3/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial4/dense_3/bias
w
4trial4/dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_3/bias*
_output_shapes
: 
w
trial4/dense_3/bias/AssignAssignVariableOptrial4/dense_3/bias%trial4/dense_3/bias/Initializer/zeros*
dtype0
x
'trial4/dense_3/bias/Read/ReadVariableOpReadVariableOptrial4/dense_3/bias*
_output_shapes	
:*
dtype0
|
$trial4/dense_3/MatMul/ReadVariableOpReadVariableOptrial4/dense_3/kernel* 
_output_shapes
:
*
dtype0

trial4/dense_3/MatMulMatMul
trial4/add$trial4/dense_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial4/dense_3/BiasAdd/ReadVariableOpReadVariableOptrial4/dense_3/bias*
_output_shapes	
:*
dtype0

trial4/dense_3/BiasAddBiasAddtrial4/dense_3/MatMul%trial4/dense_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
{
trial4/add_1AddV2trial4/dropout_1/Identitytrial4/dense_3/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial4/dense_4/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial4/dense_4/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°½
£
4trial4/dense_4/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°=
θ
>trial4/dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial4/dense_4/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
:	*
dtype0
ς
4trial4/dense_4/kernel/Initializer/random_uniform/subSub4trial4/dense_4/kernel/Initializer/random_uniform/max4trial4/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
: 

4trial4/dense_4/kernel/Initializer/random_uniform/mulMul>trial4/dense_4/kernel/Initializer/random_uniform/RandomUniform4trial4/dense_4/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
:	
χ
0trial4/dense_4/kernel/Initializer/random_uniformAdd4trial4/dense_4/kernel/Initializer/random_uniform/mul4trial4/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
:	
±
trial4/dense_4/kernelVarHandleOp*(
_class
loc:@trial4/dense_4/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial4/dense_4/kernel
{
6trial4/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_4/kernel*
_output_shapes
: 

trial4/dense_4/kernel/AssignAssignVariableOptrial4/dense_4/kernel0trial4/dense_4/kernel/Initializer/random_uniform*
dtype0

)trial4/dense_4/kernel/Read/ReadVariableOpReadVariableOptrial4/dense_4/kernel*
_output_shapes
:	*
dtype0

%trial4/dense_4/bias/Initializer/zerosConst*&
_class
loc:@trial4/dense_4/bias*
_output_shapes
:*
dtype0*
valueB*    
¦
trial4/dense_4/biasVarHandleOp*&
_class
loc:@trial4/dense_4/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial4/dense_4/bias
w
4trial4/dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial4/dense_4/bias*
_output_shapes
: 
w
trial4/dense_4/bias/AssignAssignVariableOptrial4/dense_4/bias%trial4/dense_4/bias/Initializer/zeros*
dtype0
w
'trial4/dense_4/bias/Read/ReadVariableOpReadVariableOptrial4/dense_4/bias*
_output_shapes
:*
dtype0
{
$trial4/dense_4/MatMul/ReadVariableOpReadVariableOptrial4/dense_4/kernel*
_output_shapes
:	*
dtype0

trial4/dense_4/MatMulMatMultrial4/add_1$trial4/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
u
%trial4/dense_4/BiasAdd/ReadVariableOpReadVariableOptrial4/dense_4/bias*
_output_shapes
:*
dtype0

trial4/dense_4/BiasAddBiasAddtrial4/dense_4/MatMul%trial4/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????
`

Identity_3Identitytrial4/dense_4/BiasAdd*
T0*'
_output_shapes
:?????????

Aplaceholder/trial4/input_layer/preset_embedding/embedding_weightsPlaceholder*
_output_shapes

:*
dtype0*
shape
:
?
AssignVariableOp_33AssignVariableOp5trial4/input_layer/preset_embedding/embedding_weightsAplaceholder/trial4/input_layer/preset_embedding/embedding_weights*
dtype0

ReadVariableOp_33ReadVariableOp5trial4/input_layer/preset_embedding/embedding_weights^AssignVariableOp_33*
_output_shapes

:*
dtype0
r
placeholder/trial4/dense/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
j
AssignVariableOp_34AssignVariableOptrial4/dense/kernelplaceholder/trial4/dense/kernel*
dtype0
|
ReadVariableOp_34ReadVariableOptrial4/dense/kernel^AssignVariableOp_34*
_output_shapes
:	*
dtype0
h
placeholder/trial4/dense/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
f
AssignVariableOp_35AssignVariableOptrial4/dense/biasplaceholder/trial4/dense/bias*
dtype0
v
ReadVariableOp_35ReadVariableOptrial4/dense/bias^AssignVariableOp_35*
_output_shapes	
:*
dtype0
t
!placeholder/trial4/dense_1/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_36AssignVariableOptrial4/dense_1/kernel!placeholder/trial4/dense_1/kernel*
dtype0
~
ReadVariableOp_36ReadVariableOptrial4/dense_1/kernel^AssignVariableOp_36*
_output_shapes
:	*
dtype0
j
placeholder/trial4/dense_1/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_37AssignVariableOptrial4/dense_1/biasplaceholder/trial4/dense_1/bias*
dtype0
x
ReadVariableOp_37ReadVariableOptrial4/dense_1/bias^AssignVariableOp_37*
_output_shapes	
:*
dtype0
v
!placeholder/trial4/dense_2/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_38AssignVariableOptrial4/dense_2/kernel!placeholder/trial4/dense_2/kernel*
dtype0

ReadVariableOp_38ReadVariableOptrial4/dense_2/kernel^AssignVariableOp_38* 
_output_shapes
:
*
dtype0
j
placeholder/trial4/dense_2/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_39AssignVariableOptrial4/dense_2/biasplaceholder/trial4/dense_2/bias*
dtype0
x
ReadVariableOp_39ReadVariableOptrial4/dense_2/bias^AssignVariableOp_39*
_output_shapes	
:*
dtype0
v
!placeholder/trial4/dense_3/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_40AssignVariableOptrial4/dense_3/kernel!placeholder/trial4/dense_3/kernel*
dtype0

ReadVariableOp_40ReadVariableOptrial4/dense_3/kernel^AssignVariableOp_40* 
_output_shapes
:
*
dtype0
j
placeholder/trial4/dense_3/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_41AssignVariableOptrial4/dense_3/biasplaceholder/trial4/dense_3/bias*
dtype0
x
ReadVariableOp_41ReadVariableOptrial4/dense_3/bias^AssignVariableOp_41*
_output_shapes	
:*
dtype0
t
!placeholder/trial4/dense_4/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_42AssignVariableOptrial4/dense_4/kernel!placeholder/trial4/dense_4/kernel*
dtype0
~
ReadVariableOp_42ReadVariableOptrial4/dense_4/kernel^AssignVariableOp_42*
_output_shapes
:	*
dtype0
h
placeholder/trial4/dense_4/biasPlaceholder*
_output_shapes
:*
dtype0*
shape:
j
AssignVariableOp_43AssignVariableOptrial4/dense_4/biasplaceholder/trial4/dense_4/bias*
dtype0
w
ReadVariableOp_43ReadVariableOptrial4/dense_4/bias^AssignVariableOp_43*
_output_shapes
:*
dtype0

group_deps_3NoOp^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43
[
Shape_4Shape$transform/transform/strided_slice_41*
T0*
_output_shapes
:
_
strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 
a
strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
·
strided_slice_4StridedSliceShape_4strided_slice_4/stackstrided_slice_4/stack_1strided_slice_4/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
s
1trial5/input_layer/preset_embedding/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :

/trial5/input_layer/preset_embedding/num_bucketsCast1trial5/input_layer/preset_embedding/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
l
*trial5/input_layer/preset_embedding/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial5/input_layer/preset_embedding/zeroCast*trial5/input_layer/preset_embedding/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
Ν
(trial5/input_layer/preset_embedding/LessLessCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2(trial5/input_layer/preset_embedding/zero*
T0	*#
_output_shapes
:?????????
δ
0trial5/input_layer/preset_embedding/GreaterEqualGreaterEqualCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2/trial5/input_layer/preset_embedding/num_buckets*
T0	*#
_output_shapes
:?????????
Ύ
0trial5/input_layer/preset_embedding/out_of_range	LogicalOr(trial5/input_layer/preset_embedding/Less0trial5/input_layer/preset_embedding/GreaterEqual*#
_output_shapes
:?????????

)trial5/input_layer/preset_embedding/ShapeShapeCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*
_output_shapes
:
l
*trial5/input_layer/preset_embedding/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 

(trial5/input_layer/preset_embedding/CastCast*trial5/input_layer/preset_embedding/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
½
2trial5/input_layer/preset_embedding/default_valuesFill)trial5/input_layer/preset_embedding/Shape(trial5/input_layer/preset_embedding/Cast*
T0	*#
_output_shapes
:?????????

,trial5/input_layer/preset_embedding/SelectV2SelectV20trial5/input_layer/preset_embedding/out_of_range2trial5/input_layer/preset_embedding/default_valuesCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2*
T0	*#
_output_shapes
:?????????
σ
Xtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes
:*
dtype0*
valueB"      
ζ
Wtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *    
θ
Ytrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddevConst*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
valueB
 *Α>
Ο
btrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Vtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulMulbtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/TruncatedNormalYtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/stddev*
T0*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes

:
ύ
Rtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normalAddVtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mulWtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal/mean*
T0*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes

:

5trial5/input_layer/preset_embedding/embedding_weightsVarHandleOp*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes
: *
dtype0*
shape
:*F
shared_name75trial5/input_layer/preset_embedding/embedding_weights
»
Vtrial5/input_layer/preset_embedding/embedding_weights/IsInitialized/VarIsInitializedOpVarIsInitializedOp5trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes
: 
θ
<trial5/input_layer/preset_embedding/embedding_weights/AssignAssignVariableOp5trial5/input_layer/preset_embedding/embedding_weightsRtrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal*
dtype0
Ώ
Itrial5/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpReadVariableOp5trial5/input_layer/preset_embedding/embedding_weights*
_output_shapes

:*
dtype0

Htrial5/input_layer/preset_embedding/preset_embedding_weights/Slice/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Gtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Θ
Btrial5/input_layer/preset_embedding/preset_embedding_weights/SliceSlice6transform/transform/inputs/inputs/preset/preset_2_copyHtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice/beginGtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:

Btrial5/input_layer/preset_embedding/preset_embedding_weights/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
ς
Atrial5/input_layer/preset_embedding/preset_embedding_weights/ProdProdBtrial5/input_layer/preset_embedding/preset_embedding_weights/SliceBtrial5/input_layer/preset_embedding/preset_embedding_weights/Const*
T0	*
_output_shapes
: 

Mtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesConst*
_output_shapes
: *
dtype0*
value	B :

Jtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
θ
Etrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2GatherV26transform/transform/inputs/inputs/preset/preset_2_copyMtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2/indicesJtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 

Ctrial5/input_layer/preset_embedding/preset_embedding_weights/Cast/xPackAtrial5/input_layer/preset_embedding/preset_embedding_weights/ProdEtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2*
N*
T0	*
_output_shapes
:
Δ
Jtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeSparseReshape;transform/transform/SparseFillEmptyRows/SparseFillEmptyRows6transform/transform/inputs/inputs/preset/preset_2_copyCtrial5/input_layer/preset_embedding/preset_embedding_weights/Cast/x*-
_output_shapes
:?????????:
»
Strial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityIdentity,trial5/input_layer/preset_embedding/SelectV2*
T0	*#
_output_shapes
:?????????

Ktrial5/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
©
Itrial5/input_layer/preset_embedding/preset_embedding_weights/GreaterEqualGreaterEqualStrial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityKtrial5/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
Ώ
Btrial5/input_layer/preset_embedding/preset_embedding_weights/WhereWhereItrial5/input_layer/preset_embedding/preset_embedding_weights/GreaterEqual*'
_output_shapes
:?????????

Jtrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????

Dtrial5/input_layer/preset_embedding/preset_embedding_weights/ReshapeReshapeBtrial5/input_layer/preset_embedding/preset_embedding_weights/WhereJtrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????

Ltrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1GatherV2Jtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshapeDtrial5/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????

Ltrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

Gtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2GatherV2Strial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshape/IdentityDtrial5/input_layer/preset_embedding/preset_embedding_weights/ReshapeLtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
Δ
Etrial5/input_layer/preset_embedding/preset_embedding_weights/IdentityIdentityLtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:

Vtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R 

dtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsGtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_1Gtrial5/input_layer/preset_embedding/preset_embedding_weights/GatherV2_2Etrial5/input_layer/preset_embedding/preset_embedding_weights/IdentityVtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
Ή
htrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        
»
jtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       
»
jtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      

btrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlicedtrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowshtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stackjtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1jtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_mask

[trial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/UniqueUniqueftrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????

etrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookupResourceGather5trial5/input_layer/preset_embedding/embedding_weights[trial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique*
Tindices0	*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????*
dtype0
έ
ntrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentityetrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*H
_class>
<:loc:@trial5/input_layer/preset_embedding/embedding_weights*'
_output_shapes
:?????????

ptrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1Identityntrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity*
T0*'
_output_shapes
:?????????
β
Ttrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparseSparseSegmentSumptrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity_1]trial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/Unique:1btrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse/strided_slice*
T0*
Tsegmentids0	*'
_output_shapes
:?????????

Ltrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   
Ή
Ftrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Reshapeftrial5/input_layer/preset_embedding/preset_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2Ltrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
Ζ
Btrial5/input_layer/preset_embedding/preset_embedding_weights/ShapeShapeTtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:

Ptrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:

Rtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

Rtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ή
Jtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_sliceStridedSliceBtrial5/input_layer/preset_embedding/preset_embedding_weights/ShapePtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stackRtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_1Rtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask

Dtrial5/input_layer/preset_embedding/preset_embedding_weights/stack/0Const*
_output_shapes
: *
dtype0*
value	B :

Btrial5/input_layer/preset_embedding/preset_embedding_weights/stackPackDtrial5/input_layer/preset_embedding/preset_embedding_weights/stack/0Jtrial5/input_layer/preset_embedding/preset_embedding_weights/strided_slice*
N*
T0*
_output_shapes
:

Atrial5/input_layer/preset_embedding/preset_embedding_weights/TileTileFtrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_1Btrial5/input_layer/preset_embedding/preset_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
ά
Gtrial5/input_layer/preset_embedding/preset_embedding_weights/zeros_like	ZerosLikeTtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
Ϊ
<trial5/input_layer/preset_embedding/preset_embedding_weightsSelectAtrial5/input_layer/preset_embedding/preset_embedding_weights/TileGtrial5/input_layer/preset_embedding/preset_embedding_weights/zeros_likeTtrial5/input_layer/preset_embedding/preset_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
·
Ctrial5/input_layer/preset_embedding/preset_embedding_weights/Cast_1Cast6transform/transform/inputs/inputs/preset/preset_2_copy*

DstT0*

SrcT0	*
_output_shapes
:

Jtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginConst*
_output_shapes
:*
dtype0*
valueB: 

Itrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1/sizeConst*
_output_shapes
:*
dtype0*
valueB:
Ϋ
Dtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1SliceCtrial5/input_layer/preset_embedding/preset_embedding_weights/Cast_1Jtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1/beginItrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
°
Dtrial5/input_layer/preset_embedding/preset_embedding_weights/Shape_1Shape<trial5/input_layer/preset_embedding/preset_embedding_weights*
T0*
_output_shapes
:

Jtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginConst*
_output_shapes
:*
dtype0*
valueB:

Itrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2/sizeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
ά
Dtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2SliceDtrial5/input_layer/preset_embedding/preset_embedding_weights/Shape_1Jtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2/beginItrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:

Htrial5/input_layer/preset_embedding/preset_embedding_weights/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Σ
Ctrial5/input_layer/preset_embedding/preset_embedding_weights/concatConcatV2Dtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_1Dtrial5/input_layer/preset_embedding/preset_embedding_weights/Slice_2Htrial5/input_layer/preset_embedding/preset_embedding_weights/concat/axis*
N*
T0*
_output_shapes
:

Ftrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_2Reshape<trial5/input_layer/preset_embedding/preset_embedding_weightsCtrial5/input_layer/preset_embedding/preset_embedding_weights/concat*
T0*'
_output_shapes
:?????????
‘
+trial5/input_layer/preset_embedding/Shape_1ShapeFtrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_2*
T0*
_output_shapes
:

7trial5/input_layer/preset_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 

9trial5/input_layer/preset_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:

9trial5/input_layer/preset_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
γ
1trial5/input_layer/preset_embedding/strided_sliceStridedSlice+trial5/input_layer/preset_embedding/Shape_17trial5/input_layer/preset_embedding/strided_slice/stack9trial5/input_layer/preset_embedding/strided_slice/stack_19trial5/input_layer/preset_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
u
3trial5/input_layer/preset_embedding/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
Ο
1trial5/input_layer/preset_embedding/Reshape/shapePack1trial5/input_layer/preset_embedding/strided_slice3trial5/input_layer/preset_embedding/Reshape/shape/1*
N*
T0*
_output_shapes
:
γ
+trial5/input_layer/preset_embedding/ReshapeReshapeFtrial5/input_layer/preset_embedding/preset_embedding_weights/Reshape_21trial5/input_layer/preset_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
f
$trial5/input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :

 trial5/input_layer/concat/concatIdentity+trial5/input_layer/preset_embedding/Reshape*
T0*'
_output_shapes
:?????????
\
trial5/ShapeShape trial5/input_layer/concat/concat*
T0*
_output_shapes
:
d
trial5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
f
trial5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
trial5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Π
trial5/strided_sliceStridedSlicetrial5/Shapetrial5/strided_slice/stacktrial5/strided_slice/stack_1trial5/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
Y
trial5/CastCasttrial5/strided_slice*

DstT0*

SrcT0*
_output_shapes
: 
]
trial5/concat/axisConst*
_output_shapes
: *
dtype0*
valueB :
?????????

trial5/concatConcatV2 trial5/input_layer/concat/concat$transform/transform/strided_slice_58$transform/transform/strided_slice_59$transform/transform/strided_slice_48$transform/transform/strided_slice_49$transform/transform/strided_slice_50$transform/transform/strided_slice_51$transform/transform/strided_slice_44$transform/transform/strided_slice_45$transform/transform/strided_slice_40$transform/transform/strided_slice_41$transform/transform/strided_slice_42$transform/transform/strided_slice_43$transform/transform/strided_slice_46$transform/transform/strided_slice_47$transform/transform/strided_slice_52$transform/transform/strided_slice_53$transform/transform/strided_slice_56$transform/transform/strided_slice_57$transform/transform/strided_slice_54$transform/transform/strided_slice_55trial5/concat/axis*
N*
T0*'
_output_shapes
:?????????
­
4trial5/dense/kernel/Initializer/random_uniform/shapeConst*&
_class
loc:@trial5/dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

2trial5/dense/kernel/Initializer/random_uniform/minConst*&
_class
loc:@trial5/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ

2trial5/dense/kernel/Initializer/random_uniform/maxConst*&
_class
loc:@trial5/dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
β
<trial5/dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform4trial5/dense/kernel/Initializer/random_uniform/shape*
T0*&
_class
loc:@trial5/dense/kernel*
_output_shapes
:	*
dtype0
κ
2trial5/dense/kernel/Initializer/random_uniform/subSub2trial5/dense/kernel/Initializer/random_uniform/max2trial5/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial5/dense/kernel*
_output_shapes
: 
ύ
2trial5/dense/kernel/Initializer/random_uniform/mulMul<trial5/dense/kernel/Initializer/random_uniform/RandomUniform2trial5/dense/kernel/Initializer/random_uniform/sub*
T0*&
_class
loc:@trial5/dense/kernel*
_output_shapes
:	
ο
.trial5/dense/kernel/Initializer/random_uniformAdd2trial5/dense/kernel/Initializer/random_uniform/mul2trial5/dense/kernel/Initializer/random_uniform/min*
T0*&
_class
loc:@trial5/dense/kernel*
_output_shapes
:	
«
trial5/dense/kernelVarHandleOp*&
_class
loc:@trial5/dense/kernel*
_output_shapes
: *
dtype0*
shape:	*$
shared_nametrial5/dense/kernel
w
4trial5/dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense/kernel*
_output_shapes
: 

trial5/dense/kernel/AssignAssignVariableOptrial5/dense/kernel.trial5/dense/kernel/Initializer/random_uniform*
dtype0
|
'trial5/dense/kernel/Read/ReadVariableOpReadVariableOptrial5/dense/kernel*
_output_shapes
:	*
dtype0

#trial5/dense/bias/Initializer/zerosConst*$
_class
loc:@trial5/dense/bias*
_output_shapes	
:*
dtype0*
valueB*    
‘
trial5/dense/biasVarHandleOp*$
_class
loc:@trial5/dense/bias*
_output_shapes
: *
dtype0*
shape:*"
shared_nametrial5/dense/bias
s
2trial5/dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense/bias*
_output_shapes
: 
q
trial5/dense/bias/AssignAssignVariableOptrial5/dense/bias#trial5/dense/bias/Initializer/zeros*
dtype0
t
%trial5/dense/bias/Read/ReadVariableOpReadVariableOptrial5/dense/bias*
_output_shapes	
:*
dtype0
w
"trial5/dense/MatMul/ReadVariableOpReadVariableOptrial5/dense/kernel*
_output_shapes
:	*
dtype0

trial5/dense/MatMulMatMultrial5/concat"trial5/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
r
#trial5/dense/BiasAdd/ReadVariableOpReadVariableOptrial5/dense/bias*
_output_shapes	
:*
dtype0

trial5/dense/BiasAddBiasAddtrial5/dense/MatMul#trial5/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
\
trial5/ReluRelutrial5/dense/BiasAdd*
T0*(
_output_shapes
:?????????
c
trial5/dropout/IdentityIdentitytrial5/Relu*
T0*(
_output_shapes
:?????????
±
6trial5/dense_1/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial5/dense_1/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ύ
£
4trial5/dense_1/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *>
θ
>trial5/dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial5/dense_1/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
:	*
dtype0
ς
4trial5/dense_1/kernel/Initializer/random_uniform/subSub4trial5/dense_1/kernel/Initializer/random_uniform/max4trial5/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
: 

4trial5/dense_1/kernel/Initializer/random_uniform/mulMul>trial5/dense_1/kernel/Initializer/random_uniform/RandomUniform4trial5/dense_1/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
:	
χ
0trial5/dense_1/kernel/Initializer/random_uniformAdd4trial5/dense_1/kernel/Initializer/random_uniform/mul4trial5/dense_1/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
:	
±
trial5/dense_1/kernelVarHandleOp*(
_class
loc:@trial5/dense_1/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial5/dense_1/kernel
{
6trial5/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_1/kernel*
_output_shapes
: 

trial5/dense_1/kernel/AssignAssignVariableOptrial5/dense_1/kernel0trial5/dense_1/kernel/Initializer/random_uniform*
dtype0

)trial5/dense_1/kernel/Read/ReadVariableOpReadVariableOptrial5/dense_1/kernel*
_output_shapes
:	*
dtype0

%trial5/dense_1/bias/Initializer/zerosConst*&
_class
loc:@trial5/dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    
§
trial5/dense_1/biasVarHandleOp*&
_class
loc:@trial5/dense_1/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial5/dense_1/bias
w
4trial5/dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_1/bias*
_output_shapes
: 
w
trial5/dense_1/bias/AssignAssignVariableOptrial5/dense_1/bias%trial5/dense_1/bias/Initializer/zeros*
dtype0
x
'trial5/dense_1/bias/Read/ReadVariableOpReadVariableOptrial5/dense_1/bias*
_output_shapes	
:*
dtype0
{
$trial5/dense_1/MatMul/ReadVariableOpReadVariableOptrial5/dense_1/kernel*
_output_shapes
:	*
dtype0

trial5/dense_1/MatMulMatMultrial5/concat$trial5/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial5/dense_1/BiasAdd/ReadVariableOpReadVariableOptrial5/dense_1/bias*
_output_shapes	
:*
dtype0

trial5/dense_1/BiasAddBiasAddtrial5/dense_1/MatMul%trial5/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
w

trial5/addAddV2trial5/dropout/Identitytrial5/dense_1/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial5/dense_2/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial5/dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial5/dense_2/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial5/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial5/dense_2/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial5/dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial5/dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial5/dense_2/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial5/dense_2/kernel* 
_output_shapes
:
*
dtype0
ς
4trial5/dense_2/kernel/Initializer/random_uniform/subSub4trial5/dense_2/kernel/Initializer/random_uniform/max4trial5/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_2/kernel*
_output_shapes
: 

4trial5/dense_2/kernel/Initializer/random_uniform/mulMul>trial5/dense_2/kernel/Initializer/random_uniform/RandomUniform4trial5/dense_2/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial5/dense_2/kernel* 
_output_shapes
:

ψ
0trial5/dense_2/kernel/Initializer/random_uniformAdd4trial5/dense_2/kernel/Initializer/random_uniform/mul4trial5/dense_2/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_2/kernel* 
_output_shapes
:

²
trial5/dense_2/kernelVarHandleOp*(
_class
loc:@trial5/dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial5/dense_2/kernel
{
6trial5/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_2/kernel*
_output_shapes
: 

trial5/dense_2/kernel/AssignAssignVariableOptrial5/dense_2/kernel0trial5/dense_2/kernel/Initializer/random_uniform*
dtype0

)trial5/dense_2/kernel/Read/ReadVariableOpReadVariableOptrial5/dense_2/kernel* 
_output_shapes
:
*
dtype0
¨
5trial5/dense_2/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial5/dense_2/bias*
_output_shapes
:*
dtype0*
valueB:

+trial5/dense_2/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial5/dense_2/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial5/dense_2/bias/Initializer/zerosFill5trial5/dense_2/bias/Initializer/zeros/shape_as_tensor+trial5/dense_2/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial5/dense_2/bias*
_output_shapes	
:
§
trial5/dense_2/biasVarHandleOp*&
_class
loc:@trial5/dense_2/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial5/dense_2/bias
w
4trial5/dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_2/bias*
_output_shapes
: 
w
trial5/dense_2/bias/AssignAssignVariableOptrial5/dense_2/bias%trial5/dense_2/bias/Initializer/zeros*
dtype0
x
'trial5/dense_2/bias/Read/ReadVariableOpReadVariableOptrial5/dense_2/bias*
_output_shapes	
:*
dtype0
|
$trial5/dense_2/MatMul/ReadVariableOpReadVariableOptrial5/dense_2/kernel* 
_output_shapes
:
*
dtype0

trial5/dense_2/MatMulMatMul
trial5/add$trial5/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial5/dense_2/BiasAdd/ReadVariableOpReadVariableOptrial5/dense_2/bias*
_output_shapes	
:*
dtype0

trial5/dense_2/BiasAddBiasAddtrial5/dense_2/MatMul%trial5/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
`
trial5/Relu_1Relutrial5/dense_2/BiasAdd*
T0*(
_output_shapes
:?????????
g
trial5/dropout_1/IdentityIdentitytrial5/Relu_1*
T0*(
_output_shapes
:?????????
±
6trial5/dense_3/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial5/dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial5/dense_3/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial5/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7½
£
4trial5/dense_3/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial5/dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *7=
ι
>trial5/dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial5/dense_3/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial5/dense_3/kernel* 
_output_shapes
:
*
dtype0
ς
4trial5/dense_3/kernel/Initializer/random_uniform/subSub4trial5/dense_3/kernel/Initializer/random_uniform/max4trial5/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_3/kernel*
_output_shapes
: 

4trial5/dense_3/kernel/Initializer/random_uniform/mulMul>trial5/dense_3/kernel/Initializer/random_uniform/RandomUniform4trial5/dense_3/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial5/dense_3/kernel* 
_output_shapes
:

ψ
0trial5/dense_3/kernel/Initializer/random_uniformAdd4trial5/dense_3/kernel/Initializer/random_uniform/mul4trial5/dense_3/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_3/kernel* 
_output_shapes
:

²
trial5/dense_3/kernelVarHandleOp*(
_class
loc:@trial5/dense_3/kernel*
_output_shapes
: *
dtype0*
shape:
*&
shared_nametrial5/dense_3/kernel
{
6trial5/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_3/kernel*
_output_shapes
: 

trial5/dense_3/kernel/AssignAssignVariableOptrial5/dense_3/kernel0trial5/dense_3/kernel/Initializer/random_uniform*
dtype0

)trial5/dense_3/kernel/Read/ReadVariableOpReadVariableOptrial5/dense_3/kernel* 
_output_shapes
:
*
dtype0
¨
5trial5/dense_3/bias/Initializer/zeros/shape_as_tensorConst*&
_class
loc:@trial5/dense_3/bias*
_output_shapes
:*
dtype0*
valueB:

+trial5/dense_3/bias/Initializer/zeros/ConstConst*&
_class
loc:@trial5/dense_3/bias*
_output_shapes
: *
dtype0*
valueB
 *    
ί
%trial5/dense_3/bias/Initializer/zerosFill5trial5/dense_3/bias/Initializer/zeros/shape_as_tensor+trial5/dense_3/bias/Initializer/zeros/Const*
T0*&
_class
loc:@trial5/dense_3/bias*
_output_shapes	
:
§
trial5/dense_3/biasVarHandleOp*&
_class
loc:@trial5/dense_3/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial5/dense_3/bias
w
4trial5/dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_3/bias*
_output_shapes
: 
w
trial5/dense_3/bias/AssignAssignVariableOptrial5/dense_3/bias%trial5/dense_3/bias/Initializer/zeros*
dtype0
x
'trial5/dense_3/bias/Read/ReadVariableOpReadVariableOptrial5/dense_3/bias*
_output_shapes	
:*
dtype0
|
$trial5/dense_3/MatMul/ReadVariableOpReadVariableOptrial5/dense_3/kernel* 
_output_shapes
:
*
dtype0

trial5/dense_3/MatMulMatMul
trial5/add$trial5/dense_3/MatMul/ReadVariableOp*
T0*(
_output_shapes
:?????????
v
%trial5/dense_3/BiasAdd/ReadVariableOpReadVariableOptrial5/dense_3/bias*
_output_shapes	
:*
dtype0

trial5/dense_3/BiasAddBiasAddtrial5/dense_3/MatMul%trial5/dense_3/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:?????????
{
trial5/add_1AddV2trial5/dropout_1/Identitytrial5/dense_3/BiasAdd*
T0*(
_output_shapes
:?????????
±
6trial5/dense_4/kernel/Initializer/random_uniform/shapeConst*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"      
£
4trial5/dense_4/kernel/Initializer/random_uniform/minConst*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°½
£
4trial5/dense_4/kernel/Initializer/random_uniform/maxConst*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *ά°=
θ
>trial5/dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform6trial5/dense_4/kernel/Initializer/random_uniform/shape*
T0*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
:	*
dtype0
ς
4trial5/dense_4/kernel/Initializer/random_uniform/subSub4trial5/dense_4/kernel/Initializer/random_uniform/max4trial5/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
: 

4trial5/dense_4/kernel/Initializer/random_uniform/mulMul>trial5/dense_4/kernel/Initializer/random_uniform/RandomUniform4trial5/dense_4/kernel/Initializer/random_uniform/sub*
T0*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
:	
χ
0trial5/dense_4/kernel/Initializer/random_uniformAdd4trial5/dense_4/kernel/Initializer/random_uniform/mul4trial5/dense_4/kernel/Initializer/random_uniform/min*
T0*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
:	
±
trial5/dense_4/kernelVarHandleOp*(
_class
loc:@trial5/dense_4/kernel*
_output_shapes
: *
dtype0*
shape:	*&
shared_nametrial5/dense_4/kernel
{
6trial5/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_4/kernel*
_output_shapes
: 

trial5/dense_4/kernel/AssignAssignVariableOptrial5/dense_4/kernel0trial5/dense_4/kernel/Initializer/random_uniform*
dtype0

)trial5/dense_4/kernel/Read/ReadVariableOpReadVariableOptrial5/dense_4/kernel*
_output_shapes
:	*
dtype0

%trial5/dense_4/bias/Initializer/zerosConst*&
_class
loc:@trial5/dense_4/bias*
_output_shapes
:*
dtype0*
valueB*    
¦
trial5/dense_4/biasVarHandleOp*&
_class
loc:@trial5/dense_4/bias*
_output_shapes
: *
dtype0*
shape:*$
shared_nametrial5/dense_4/bias
w
4trial5/dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOptrial5/dense_4/bias*
_output_shapes
: 
w
trial5/dense_4/bias/AssignAssignVariableOptrial5/dense_4/bias%trial5/dense_4/bias/Initializer/zeros*
dtype0
w
'trial5/dense_4/bias/Read/ReadVariableOpReadVariableOptrial5/dense_4/bias*
_output_shapes
:*
dtype0
{
$trial5/dense_4/MatMul/ReadVariableOpReadVariableOptrial5/dense_4/kernel*
_output_shapes
:	*
dtype0

trial5/dense_4/MatMulMatMultrial5/add_1$trial5/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
u
%trial5/dense_4/BiasAdd/ReadVariableOpReadVariableOptrial5/dense_4/bias*
_output_shapes
:*
dtype0

trial5/dense_4/BiasAddBiasAddtrial5/dense_4/MatMul%trial5/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:?????????
`

Identity_4Identitytrial5/dense_4/BiasAdd*
T0*'
_output_shapes
:?????????

Aplaceholder/trial5/input_layer/preset_embedding/embedding_weightsPlaceholder*
_output_shapes

:*
dtype0*
shape
:
?
AssignVariableOp_44AssignVariableOp5trial5/input_layer/preset_embedding/embedding_weightsAplaceholder/trial5/input_layer/preset_embedding/embedding_weights*
dtype0

ReadVariableOp_44ReadVariableOp5trial5/input_layer/preset_embedding/embedding_weights^AssignVariableOp_44*
_output_shapes

:*
dtype0
r
placeholder/trial5/dense/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
j
AssignVariableOp_45AssignVariableOptrial5/dense/kernelplaceholder/trial5/dense/kernel*
dtype0
|
ReadVariableOp_45ReadVariableOptrial5/dense/kernel^AssignVariableOp_45*
_output_shapes
:	*
dtype0
h
placeholder/trial5/dense/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
f
AssignVariableOp_46AssignVariableOptrial5/dense/biasplaceholder/trial5/dense/bias*
dtype0
v
ReadVariableOp_46ReadVariableOptrial5/dense/bias^AssignVariableOp_46*
_output_shapes	
:*
dtype0
t
!placeholder/trial5/dense_1/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_47AssignVariableOptrial5/dense_1/kernel!placeholder/trial5/dense_1/kernel*
dtype0
~
ReadVariableOp_47ReadVariableOptrial5/dense_1/kernel^AssignVariableOp_47*
_output_shapes
:	*
dtype0
j
placeholder/trial5/dense_1/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_48AssignVariableOptrial5/dense_1/biasplaceholder/trial5/dense_1/bias*
dtype0
x
ReadVariableOp_48ReadVariableOptrial5/dense_1/bias^AssignVariableOp_48*
_output_shapes	
:*
dtype0
v
!placeholder/trial5/dense_2/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_49AssignVariableOptrial5/dense_2/kernel!placeholder/trial5/dense_2/kernel*
dtype0

ReadVariableOp_49ReadVariableOptrial5/dense_2/kernel^AssignVariableOp_49* 
_output_shapes
:
*
dtype0
j
placeholder/trial5/dense_2/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_50AssignVariableOptrial5/dense_2/biasplaceholder/trial5/dense_2/bias*
dtype0
x
ReadVariableOp_50ReadVariableOptrial5/dense_2/bias^AssignVariableOp_50*
_output_shapes	
:*
dtype0
v
!placeholder/trial5/dense_3/kernelPlaceholder* 
_output_shapes
:
*
dtype0*
shape:

n
AssignVariableOp_51AssignVariableOptrial5/dense_3/kernel!placeholder/trial5/dense_3/kernel*
dtype0

ReadVariableOp_51ReadVariableOptrial5/dense_3/kernel^AssignVariableOp_51* 
_output_shapes
:
*
dtype0
j
placeholder/trial5/dense_3/biasPlaceholder*
_output_shapes	
:*
dtype0*
shape:
j
AssignVariableOp_52AssignVariableOptrial5/dense_3/biasplaceholder/trial5/dense_3/bias*
dtype0
x
ReadVariableOp_52ReadVariableOptrial5/dense_3/bias^AssignVariableOp_52*
_output_shapes	
:*
dtype0
t
!placeholder/trial5/dense_4/kernelPlaceholder*
_output_shapes
:	*
dtype0*
shape:	
n
AssignVariableOp_53AssignVariableOptrial5/dense_4/kernel!placeholder/trial5/dense_4/kernel*
dtype0
~
ReadVariableOp_53ReadVariableOptrial5/dense_4/kernel^AssignVariableOp_53*
_output_shapes
:	*
dtype0
h
placeholder/trial5/dense_4/biasPlaceholder*
_output_shapes
:*
dtype0*
shape:
j
AssignVariableOp_54AssignVariableOptrial5/dense_4/biasplaceholder/trial5/dense_4/bias*
dtype0
w
ReadVariableOp_54ReadVariableOptrial5/dense_4/bias^AssignVariableOp_54*
_output_shapes
:*
dtype0

group_deps_4NoOp^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54
_
strided_slice_5/stackConst*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_5/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_5/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ζ
strided_slice_5StridedSlice6transform/transform/inputs/inputs/preset/preset_2_copystrided_slice_5/stackstrided_slice_5/stack_1strided_slice_5/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
I
Equal/yConst*
_output_shapes
: *
dtype0	*
value	B	 R
I
EqualEqualstrided_slice_5Equal/y*
T0	*
_output_shapes
: 

condStatelessIfEqual;transform/transform/SparseFillEmptyRows/SparseFillEmptyRowsCtransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV26transform/transform/inputs/inputs/preset/preset_2_copy*
Tcond0
*
Tin
2			*
Tout
2			*
_lower_using_switch_merge(*<
_output_shapes*
(:?????????:?????????:* 
_read_only_resource_inputs
 *#
else_branchR
cond_false_10031*;
output_shapes*
(:?????????:?????????:*"
then_branchR
cond_true_10030
Q
cond/IdentityIdentitycond*
T0	*'
_output_shapes
:?????????
Q
cond/Identity_1Identitycond:1*
T0	*#
_output_shapes
:?????????
H
cond/Identity_2Identitycond:2*
T0	*
_output_shapes
:
_
strided_slice_6/stackConst*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_6/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
a
strided_slice_6/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
Ώ
strided_slice_6StridedSlicecond/Identity_2strided_slice_6/stackstrided_slice_6/stack_1strided_slice_6/stack_2*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask
K
	Equal_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R 
M
Equal_1Equalstrided_slice_6	Equal_1/y*
T0	*
_output_shapes
: 

cond_1StatelessIfEqual_1cond/Identity_2cond/Identitycond/Identity_1*
Tcond0
*
Tin
2			*
Tout
2			*
_lower_using_switch_merge(*<
_output_shapes*
(:?????????:?????????:* 
_read_only_resource_inputs
 *%
else_branchR
cond_1_false_10062*;
output_shapes*
(:?????????:?????????:*$
then_branchR
cond_1_true_10061
U
cond_1/IdentityIdentitycond_1*
T0	*'
_output_shapes
:?????????
U
cond_1/Identity_1Identitycond_1:1*
T0	*#
_output_shapes
:?????????
L
cond_1/Identity_2Identitycond_1:2*
T0	*
_output_shapes
:
G
zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 

SparseToDenseSparseToDensecond_1/Identitycond_1/Identity_2cond_1/Identity_1zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????
~
trial16/boosted_trees$BoostedTreesEnsembleResourceHandleOp*
_output_shapes
: *'
shared_nametrial16/boosted_trees/
~
<trial16/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenConst*
_output_shapes
: *
dtype0	*
value	B	 R 

Itrial16/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serializedConst*
_output_shapes
: *
dtype0*
valueB B 
ξ
0trial16/boosted_trees/BoostedTreesCreateEnsembleBoostedTreesCreateEnsembletrial16/boosted_trees<trial16/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenItrial16/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serialized

7trial16/boosted_trees/IsBoostedTreesEnsembleInitialized!IsBoostedTreesEnsembleInitializedtrial16/boosted_trees*
_output_shapes
: 

3trial16/boosted_trees/BoostedTreesSerializeEnsembleBoostedTreesSerializeEnsembletrial16/boosted_trees*
_output_shapes
: : 
¬
)trial16/boosted_trees/QuantileAccumulator*BoostedTreesQuantileStreamResourceHandleOp*
_output_shapes
: *;
shared_name,*trial16/boosted_trees/QuantileAccumulator/

Ztrial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *
Χ#<
 
^trial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streamsConst*
_output_shapes
: *
dtype0	*
value	B	 R

ε
Rtrial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource(BoostedTreesCreateQuantileStreamResource)trial16/boosted_trees/QuantileAccumulatorZtrial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilon^trial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streams
Ο
Ytrial16/boosted_trees/QuantileAccumulator/IsBoostedTreesQuantileStreamResourceInitialized/IsBoostedTreesQuantileStreamResourceInitialized)trial16/boosted_trees/QuantileAccumulator*
_output_shapes
: 
ς
Ktrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries5BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial16/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features

τ
Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_15BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial16/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features


Ntrial16/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/xConst*
_output_shapes
: *
dtype0*
valueB :
?????????
Τ
Ltrial16/boosted_trees/transform_features/preset/to_sparse_input/ignore_valueCastNtrial16/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/x*

DstT0	*

SrcT0*
_output_shapes
: 
γ
Htrial16/boosted_trees/transform_features/preset/to_sparse_input/NotEqualNotEqualSparseToDenseLtrial16/boosted_trees/transform_features/preset/to_sparse_input/ignore_value*
T0	*'
_output_shapes
:?????????
Γ
Gtrial16/boosted_trees/transform_features/preset/to_sparse_input/indicesWhereHtrial16/boosted_trees/transform_features/preset/to_sparse_input/NotEqual*'
_output_shapes
:?????????
ξ
Ftrial16/boosted_trees/transform_features/preset/to_sparse_input/valuesGatherNdSparseToDenseGtrial16/boosted_trees/transform_features/preset/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????

Ktrial16/boosted_trees/transform_features/preset/to_sparse_input/dense_shapeShapeSparseToDense*
T0	*
_output_shapes
:*
out_type0	

=trial16/boosted_trees/transform_features/preset/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :
²
;trial16/boosted_trees/transform_features/preset/num_bucketsCast=trial16/boosted_trees/transform_features/preset/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
x
6trial16/boosted_trees/transform_features/preset/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial16/boosted_trees/transform_features/preset/zeroCast6trial16/boosted_trees/transform_features/preset/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
θ
4trial16/boosted_trees/transform_features/preset/LessLessFtrial16/boosted_trees/transform_features/preset/to_sparse_input/values4trial16/boosted_trees/transform_features/preset/zero*
T0	*#
_output_shapes
:?????????
?
<trial16/boosted_trees/transform_features/preset/GreaterEqualGreaterEqualFtrial16/boosted_trees/transform_features/preset/to_sparse_input/values;trial16/boosted_trees/transform_features/preset/num_buckets*
T0	*#
_output_shapes
:?????????
β
<trial16/boosted_trees/transform_features/preset/out_of_range	LogicalOr4trial16/boosted_trees/transform_features/preset/Less<trial16/boosted_trees/transform_features/preset/GreaterEqual*#
_output_shapes
:?????????
«
5trial16/boosted_trees/transform_features/preset/ShapeShapeFtrial16/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*
_output_shapes
:
x
6trial16/boosted_trees/transform_features/preset/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial16/boosted_trees/transform_features/preset/CastCast6trial16/boosted_trees/transform_features/preset/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
α
>trial16/boosted_trees/transform_features/preset/default_valuesFill5trial16/boosted_trees/transform_features/preset/Shape4trial16/boosted_trees/transform_features/preset/Cast*
T0	*#
_output_shapes
:?????????
Έ
8trial16/boosted_trees/transform_features/preset/SelectV2SelectV2<trial16/boosted_trees/transform_features/preset/out_of_range>trial16/boosted_trees/transform_features/preset/default_valuesFtrial16/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*#
_output_shapes
:?????????

trial16/boosted_trees/unstackUnpacktransform/transform/sp2d-cores*
T0*#
_output_shapes
:?????????*

axis*	
num
λ
+trial16/boosted_trees/BoostedTreesBucketizeBoostedTreesBucketizetrial16/boosted_trees/unstackMtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1*#
_output_shapes
:?????????*
num_features
f
$trial16/boosted_trees/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :
³
 trial16/boosted_trees/ExpandDims
ExpandDims+trial16/boosted_trees/BoostedTreesBucketize$trial16/boosted_trees/ExpandDims/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_1Unpack*transform/transform/sp2d-downscaled_avg_si*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_1BoostedTreesBucketizetrial16/boosted_trees/unstack_1Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:1*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_1
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_1&trial16/boosted_trees/ExpandDims_1/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_2Unpack*transform/transform/sp2d-downscaled_avg_ti*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_2BoostedTreesBucketizetrial16/boosted_trees/unstack_2Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:2*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_2
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_2&trial16/boosted_trees/ExpandDims_2/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_3Unpack+transform/transform/sp2d-downscaled_bitrate*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_3BoostedTreesBucketizetrial16/boosted_trees/unstack_3Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:3*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_3
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_3&trial16/boosted_trees/ExpandDims_3/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_4Unpack!transform/transform/sp2d-duration*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_4BoostedTreesBucketizetrial16/boosted_trees/unstack_4Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:4*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_4
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_4&trial16/boosted_trees/ExpandDims_4/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_5Unpacktransform/transform/sp2d-fps*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_5BoostedTreesBucketizetrial16/boosted_trees/unstack_5Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:5*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_5
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_5&trial16/boosted_trees/ExpandDims_5/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_6Unpacktransform/transform/sp2d-height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_6BoostedTreesBucketizetrial16/boosted_trees/unstack_6Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:6*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_6
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_6&trial16/boosted_trees/ExpandDims_6/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_7Unpack&transform/transform/sp2d-output_height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_7BoostedTreesBucketizetrial16/boosted_trees/unstack_7Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:7*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_7
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_7&trial16/boosted_trees/ExpandDims_7/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_8Unpack&transform/transform/sp2d-output_pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_8BoostedTreesBucketizetrial16/boosted_trees/unstack_8Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:8*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_8
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_8&trial16/boosted_trees/ExpandDims_8/dim*
T0*'
_output_shapes
:?????????

trial16/boosted_trees/unstack_9Unpacktransform/transform/sp2d-pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial16/boosted_trees/BoostedTreesBucketize_9BoostedTreesBucketizetrial16/boosted_trees/unstack_9Otrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:9*#
_output_shapes
:?????????*
num_features
h
&trial16/boosted_trees/ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial16/boosted_trees/ExpandDims_9
ExpandDims-trial16/boosted_trees/BoostedTreesBucketize_9&trial16/boosted_trees/ExpandDims_9/dim*
T0*'
_output_shapes
:?????????
]
trial16/boosted_trees/zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 
γ
#trial16/boosted_trees/SparseToDenseSparseToDenseGtrial16/boosted_trees/transform_features/preset/to_sparse_input/indicesKtrial16/boosted_trees/transform_features/preset/to_sparse_input/dense_shape8trial16/boosted_trees/transform_features/preset/SelectV2trial16/boosted_trees/zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????

trial16/boosted_trees/CastCast#trial16/boosted_trees/SparseToDense*

DstT0*

SrcT0	*'
_output_shapes
:?????????
Ή
)trial16/boosted_trees/BoostedTreesPredictBoostedTreesPredicttrial16/boosted_trees trial16/boosted_trees/ExpandDims"trial16/boosted_trees/ExpandDims_1"trial16/boosted_trees/ExpandDims_2"trial16/boosted_trees/ExpandDims_3"trial16/boosted_trees/ExpandDims_4"trial16/boosted_trees/ExpandDims_5"trial16/boosted_trees/ExpandDims_6"trial16/boosted_trees/ExpandDims_7"trial16/boosted_trees/ExpandDims_8"trial16/boosted_trees/ExpandDims_9trial16/boosted_trees/Cast*'
_output_shapes
:?????????*
logits_dimension*
num_bucketized_features

'trial16/boosted_trees/head/logits/ShapeShape)trial16/boosted_trees/BoostedTreesPredict*
T0*
_output_shapes
:
}
;trial16/boosted_trees/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
m
etrial16/boosted_trees/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
^
Vtrial16/boosted_trees/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
―
save/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial16/boosted_trees:0_stampB"trial16/boosted_trees:0_serialized
{
save/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
υ
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesKtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial16/boosted_trees/BoostedTreesSerializeEnsemble5trial16/boosted_trees/BoostedTreesSerializeEnsemble:1*
dtypes
2	
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
²
save/RestoreV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial16/boosted_trees:0_stampB"trial16/boosted_trees:0_serialized
~
save/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
Η
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*D
_output_shapes2
0::::::::::::*
dtypes
2	
¨
2save/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial16/boosted_trees/QuantileAccumulatorsave/RestoreV2save/RestoreV2:1save/RestoreV2:2save/RestoreV2:3save/RestoreV2:4save/RestoreV2:5save/RestoreV2:6save/RestoreV2:7save/RestoreV2:8save/RestoreV2:9S^trial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

·
$save/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial16/boosted_treessave/RestoreV2:10save/RestoreV2:111^trial16/boosted_trees/BoostedTreesCreateEnsemble
t
save/restore_allNoOp%^save/BoostedTreesDeserializeEnsemble3^save/BoostedTreesQuantileStreamResourceDeserialize
~
trial17/boosted_trees$BoostedTreesEnsembleResourceHandleOp*
_output_shapes
: *'
shared_nametrial17/boosted_trees/
~
<trial17/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenConst*
_output_shapes
: *
dtype0	*
value	B	 R 

Itrial17/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serializedConst*
_output_shapes
: *
dtype0*
valueB B 
ξ
0trial17/boosted_trees/BoostedTreesCreateEnsembleBoostedTreesCreateEnsembletrial17/boosted_trees<trial17/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenItrial17/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serialized

7trial17/boosted_trees/IsBoostedTreesEnsembleInitialized!IsBoostedTreesEnsembleInitializedtrial17/boosted_trees*
_output_shapes
: 

3trial17/boosted_trees/BoostedTreesSerializeEnsembleBoostedTreesSerializeEnsembletrial17/boosted_trees*
_output_shapes
: : 
¬
)trial17/boosted_trees/QuantileAccumulator*BoostedTreesQuantileStreamResourceHandleOp*
_output_shapes
: *;
shared_name,*trial17/boosted_trees/QuantileAccumulator/

Ztrial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *
Χ#<
 
^trial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streamsConst*
_output_shapes
: *
dtype0	*
value	B	 R

ε
Rtrial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource(BoostedTreesCreateQuantileStreamResource)trial17/boosted_trees/QuantileAccumulatorZtrial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilon^trial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streams
Ο
Ytrial17/boosted_trees/QuantileAccumulator/IsBoostedTreesQuantileStreamResourceInitialized/IsBoostedTreesQuantileStreamResourceInitialized)trial17/boosted_trees/QuantileAccumulator*
_output_shapes
: 
ς
Ktrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries5BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial17/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features

τ
Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_15BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial17/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features


Ntrial17/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/xConst*
_output_shapes
: *
dtype0*
valueB :
?????????
Τ
Ltrial17/boosted_trees/transform_features/preset/to_sparse_input/ignore_valueCastNtrial17/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/x*

DstT0	*

SrcT0*
_output_shapes
: 
γ
Htrial17/boosted_trees/transform_features/preset/to_sparse_input/NotEqualNotEqualSparseToDenseLtrial17/boosted_trees/transform_features/preset/to_sparse_input/ignore_value*
T0	*'
_output_shapes
:?????????
Γ
Gtrial17/boosted_trees/transform_features/preset/to_sparse_input/indicesWhereHtrial17/boosted_trees/transform_features/preset/to_sparse_input/NotEqual*'
_output_shapes
:?????????
ξ
Ftrial17/boosted_trees/transform_features/preset/to_sparse_input/valuesGatherNdSparseToDenseGtrial17/boosted_trees/transform_features/preset/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????

Ktrial17/boosted_trees/transform_features/preset/to_sparse_input/dense_shapeShapeSparseToDense*
T0	*
_output_shapes
:*
out_type0	

=trial17/boosted_trees/transform_features/preset/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :
²
;trial17/boosted_trees/transform_features/preset/num_bucketsCast=trial17/boosted_trees/transform_features/preset/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
x
6trial17/boosted_trees/transform_features/preset/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial17/boosted_trees/transform_features/preset/zeroCast6trial17/boosted_trees/transform_features/preset/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
θ
4trial17/boosted_trees/transform_features/preset/LessLessFtrial17/boosted_trees/transform_features/preset/to_sparse_input/values4trial17/boosted_trees/transform_features/preset/zero*
T0	*#
_output_shapes
:?????????
?
<trial17/boosted_trees/transform_features/preset/GreaterEqualGreaterEqualFtrial17/boosted_trees/transform_features/preset/to_sparse_input/values;trial17/boosted_trees/transform_features/preset/num_buckets*
T0	*#
_output_shapes
:?????????
β
<trial17/boosted_trees/transform_features/preset/out_of_range	LogicalOr4trial17/boosted_trees/transform_features/preset/Less<trial17/boosted_trees/transform_features/preset/GreaterEqual*#
_output_shapes
:?????????
«
5trial17/boosted_trees/transform_features/preset/ShapeShapeFtrial17/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*
_output_shapes
:
x
6trial17/boosted_trees/transform_features/preset/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial17/boosted_trees/transform_features/preset/CastCast6trial17/boosted_trees/transform_features/preset/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
α
>trial17/boosted_trees/transform_features/preset/default_valuesFill5trial17/boosted_trees/transform_features/preset/Shape4trial17/boosted_trees/transform_features/preset/Cast*
T0	*#
_output_shapes
:?????????
Έ
8trial17/boosted_trees/transform_features/preset/SelectV2SelectV2<trial17/boosted_trees/transform_features/preset/out_of_range>trial17/boosted_trees/transform_features/preset/default_valuesFtrial17/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*#
_output_shapes
:?????????

trial17/boosted_trees/unstackUnpacktransform/transform/sp2d-cores*
T0*#
_output_shapes
:?????????*

axis*	
num
λ
+trial17/boosted_trees/BoostedTreesBucketizeBoostedTreesBucketizetrial17/boosted_trees/unstackMtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1*#
_output_shapes
:?????????*
num_features
f
$trial17/boosted_trees/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :
³
 trial17/boosted_trees/ExpandDims
ExpandDims+trial17/boosted_trees/BoostedTreesBucketize$trial17/boosted_trees/ExpandDims/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_1Unpack*transform/transform/sp2d-downscaled_avg_si*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_1BoostedTreesBucketizetrial17/boosted_trees/unstack_1Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:1*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_1
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_1&trial17/boosted_trees/ExpandDims_1/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_2Unpack*transform/transform/sp2d-downscaled_avg_ti*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_2BoostedTreesBucketizetrial17/boosted_trees/unstack_2Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:2*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_2
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_2&trial17/boosted_trees/ExpandDims_2/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_3Unpack+transform/transform/sp2d-downscaled_bitrate*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_3BoostedTreesBucketizetrial17/boosted_trees/unstack_3Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:3*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_3
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_3&trial17/boosted_trees/ExpandDims_3/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_4Unpack!transform/transform/sp2d-duration*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_4BoostedTreesBucketizetrial17/boosted_trees/unstack_4Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:4*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_4
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_4&trial17/boosted_trees/ExpandDims_4/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_5Unpacktransform/transform/sp2d-fps*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_5BoostedTreesBucketizetrial17/boosted_trees/unstack_5Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:5*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_5
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_5&trial17/boosted_trees/ExpandDims_5/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_6Unpacktransform/transform/sp2d-height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_6BoostedTreesBucketizetrial17/boosted_trees/unstack_6Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:6*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_6
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_6&trial17/boosted_trees/ExpandDims_6/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_7Unpack&transform/transform/sp2d-output_height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_7BoostedTreesBucketizetrial17/boosted_trees/unstack_7Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:7*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_7
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_7&trial17/boosted_trees/ExpandDims_7/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_8Unpack&transform/transform/sp2d-output_pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_8BoostedTreesBucketizetrial17/boosted_trees/unstack_8Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:8*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_8
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_8&trial17/boosted_trees/ExpandDims_8/dim*
T0*'
_output_shapes
:?????????

trial17/boosted_trees/unstack_9Unpacktransform/transform/sp2d-pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial17/boosted_trees/BoostedTreesBucketize_9BoostedTreesBucketizetrial17/boosted_trees/unstack_9Otrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:9*#
_output_shapes
:?????????*
num_features
h
&trial17/boosted_trees/ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial17/boosted_trees/ExpandDims_9
ExpandDims-trial17/boosted_trees/BoostedTreesBucketize_9&trial17/boosted_trees/ExpandDims_9/dim*
T0*'
_output_shapes
:?????????
]
trial17/boosted_trees/zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 
γ
#trial17/boosted_trees/SparseToDenseSparseToDenseGtrial17/boosted_trees/transform_features/preset/to_sparse_input/indicesKtrial17/boosted_trees/transform_features/preset/to_sparse_input/dense_shape8trial17/boosted_trees/transform_features/preset/SelectV2trial17/boosted_trees/zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????

trial17/boosted_trees/CastCast#trial17/boosted_trees/SparseToDense*

DstT0*

SrcT0	*'
_output_shapes
:?????????
Ή
)trial17/boosted_trees/BoostedTreesPredictBoostedTreesPredicttrial17/boosted_trees trial17/boosted_trees/ExpandDims"trial17/boosted_trees/ExpandDims_1"trial17/boosted_trees/ExpandDims_2"trial17/boosted_trees/ExpandDims_3"trial17/boosted_trees/ExpandDims_4"trial17/boosted_trees/ExpandDims_5"trial17/boosted_trees/ExpandDims_6"trial17/boosted_trees/ExpandDims_7"trial17/boosted_trees/ExpandDims_8"trial17/boosted_trees/ExpandDims_9trial17/boosted_trees/Cast*'
_output_shapes
:?????????*
logits_dimension*
num_bucketized_features

'trial17/boosted_trees/head/logits/ShapeShape)trial17/boosted_trees/BoostedTreesPredict*
T0*
_output_shapes
:
}
;trial17/boosted_trees/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
m
etrial17/boosted_trees/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
^
Vtrial17/boosted_trees/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
[
save_1/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
_output_shapes
: *
dtype0*
shape: 
±
save_1/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial17/boosted_trees:0_stampB"trial17/boosted_trees:0_serialized
}
save_1/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
ύ
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesKtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial17/boosted_trees/BoostedTreesSerializeEnsemble5trial17/boosted_trees/BoostedTreesSerializeEnsemble:1*
dtypes
2	

save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
T0*
_class
loc:@save_1/Const*
_output_shapes
: 
΄
save_1/RestoreV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial17/boosted_trees:0_stampB"trial17/boosted_trees:0_serialized

!save_1/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
Ο
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*D
_output_shapes2
0::::::::::::*
dtypes
2	
Ύ
4save_1/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial17/boosted_trees/QuantileAccumulatorsave_1/RestoreV2save_1/RestoreV2:1save_1/RestoreV2:2save_1/RestoreV2:3save_1/RestoreV2:4save_1/RestoreV2:5save_1/RestoreV2:6save_1/RestoreV2:7save_1/RestoreV2:8save_1/RestoreV2:9S^trial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

½
&save_1/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial17/boosted_treessave_1/RestoreV2:10save_1/RestoreV2:111^trial17/boosted_trees/BoostedTreesCreateEnsemble
z
save_1/restore_allNoOp'^save_1/BoostedTreesDeserializeEnsemble5^save_1/BoostedTreesQuantileStreamResourceDeserialize
~
trial18/boosted_trees$BoostedTreesEnsembleResourceHandleOp*
_output_shapes
: *'
shared_nametrial18/boosted_trees/
~
<trial18/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenConst*
_output_shapes
: *
dtype0	*
value	B	 R 

Itrial18/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serializedConst*
_output_shapes
: *
dtype0*
valueB B 
ξ
0trial18/boosted_trees/BoostedTreesCreateEnsembleBoostedTreesCreateEnsembletrial18/boosted_trees<trial18/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenItrial18/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serialized

7trial18/boosted_trees/IsBoostedTreesEnsembleInitialized!IsBoostedTreesEnsembleInitializedtrial18/boosted_trees*
_output_shapes
: 

3trial18/boosted_trees/BoostedTreesSerializeEnsembleBoostedTreesSerializeEnsembletrial18/boosted_trees*
_output_shapes
: : 
¬
)trial18/boosted_trees/QuantileAccumulator*BoostedTreesQuantileStreamResourceHandleOp*
_output_shapes
: *;
shared_name,*trial18/boosted_trees/QuantileAccumulator/

Ztrial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *
Χ#<
 
^trial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streamsConst*
_output_shapes
: *
dtype0	*
value	B	 R

ε
Rtrial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource(BoostedTreesCreateQuantileStreamResource)trial18/boosted_trees/QuantileAccumulatorZtrial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilon^trial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streams
Ο
Ytrial18/boosted_trees/QuantileAccumulator/IsBoostedTreesQuantileStreamResourceInitialized/IsBoostedTreesQuantileStreamResourceInitialized)trial18/boosted_trees/QuantileAccumulator*
_output_shapes
: 
ς
Ktrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries5BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial18/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features

τ
Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_15BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial18/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features


Ntrial18/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/xConst*
_output_shapes
: *
dtype0*
valueB :
?????????
Τ
Ltrial18/boosted_trees/transform_features/preset/to_sparse_input/ignore_valueCastNtrial18/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/x*

DstT0	*

SrcT0*
_output_shapes
: 
γ
Htrial18/boosted_trees/transform_features/preset/to_sparse_input/NotEqualNotEqualSparseToDenseLtrial18/boosted_trees/transform_features/preset/to_sparse_input/ignore_value*
T0	*'
_output_shapes
:?????????
Γ
Gtrial18/boosted_trees/transform_features/preset/to_sparse_input/indicesWhereHtrial18/boosted_trees/transform_features/preset/to_sparse_input/NotEqual*'
_output_shapes
:?????????
ξ
Ftrial18/boosted_trees/transform_features/preset/to_sparse_input/valuesGatherNdSparseToDenseGtrial18/boosted_trees/transform_features/preset/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????

Ktrial18/boosted_trees/transform_features/preset/to_sparse_input/dense_shapeShapeSparseToDense*
T0	*
_output_shapes
:*
out_type0	

=trial18/boosted_trees/transform_features/preset/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :
²
;trial18/boosted_trees/transform_features/preset/num_bucketsCast=trial18/boosted_trees/transform_features/preset/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
x
6trial18/boosted_trees/transform_features/preset/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial18/boosted_trees/transform_features/preset/zeroCast6trial18/boosted_trees/transform_features/preset/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
θ
4trial18/boosted_trees/transform_features/preset/LessLessFtrial18/boosted_trees/transform_features/preset/to_sparse_input/values4trial18/boosted_trees/transform_features/preset/zero*
T0	*#
_output_shapes
:?????????
?
<trial18/boosted_trees/transform_features/preset/GreaterEqualGreaterEqualFtrial18/boosted_trees/transform_features/preset/to_sparse_input/values;trial18/boosted_trees/transform_features/preset/num_buckets*
T0	*#
_output_shapes
:?????????
β
<trial18/boosted_trees/transform_features/preset/out_of_range	LogicalOr4trial18/boosted_trees/transform_features/preset/Less<trial18/boosted_trees/transform_features/preset/GreaterEqual*#
_output_shapes
:?????????
«
5trial18/boosted_trees/transform_features/preset/ShapeShapeFtrial18/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*
_output_shapes
:
x
6trial18/boosted_trees/transform_features/preset/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial18/boosted_trees/transform_features/preset/CastCast6trial18/boosted_trees/transform_features/preset/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
α
>trial18/boosted_trees/transform_features/preset/default_valuesFill5trial18/boosted_trees/transform_features/preset/Shape4trial18/boosted_trees/transform_features/preset/Cast*
T0	*#
_output_shapes
:?????????
Έ
8trial18/boosted_trees/transform_features/preset/SelectV2SelectV2<trial18/boosted_trees/transform_features/preset/out_of_range>trial18/boosted_trees/transform_features/preset/default_valuesFtrial18/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*#
_output_shapes
:?????????

trial18/boosted_trees/unstackUnpacktransform/transform/sp2d-cores*
T0*#
_output_shapes
:?????????*

axis*	
num
λ
+trial18/boosted_trees/BoostedTreesBucketizeBoostedTreesBucketizetrial18/boosted_trees/unstackMtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1*#
_output_shapes
:?????????*
num_features
f
$trial18/boosted_trees/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :
³
 trial18/boosted_trees/ExpandDims
ExpandDims+trial18/boosted_trees/BoostedTreesBucketize$trial18/boosted_trees/ExpandDims/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_1Unpack*transform/transform/sp2d-downscaled_avg_si*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_1BoostedTreesBucketizetrial18/boosted_trees/unstack_1Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:1*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_1
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_1&trial18/boosted_trees/ExpandDims_1/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_2Unpack*transform/transform/sp2d-downscaled_avg_ti*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_2BoostedTreesBucketizetrial18/boosted_trees/unstack_2Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:2*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_2
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_2&trial18/boosted_trees/ExpandDims_2/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_3Unpack+transform/transform/sp2d-downscaled_bitrate*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_3BoostedTreesBucketizetrial18/boosted_trees/unstack_3Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:3*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_3
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_3&trial18/boosted_trees/ExpandDims_3/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_4Unpack!transform/transform/sp2d-duration*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_4BoostedTreesBucketizetrial18/boosted_trees/unstack_4Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:4*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_4
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_4&trial18/boosted_trees/ExpandDims_4/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_5Unpacktransform/transform/sp2d-fps*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_5BoostedTreesBucketizetrial18/boosted_trees/unstack_5Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:5*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_5
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_5&trial18/boosted_trees/ExpandDims_5/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_6Unpacktransform/transform/sp2d-height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_6BoostedTreesBucketizetrial18/boosted_trees/unstack_6Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:6*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_6
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_6&trial18/boosted_trees/ExpandDims_6/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_7Unpack&transform/transform/sp2d-output_height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_7BoostedTreesBucketizetrial18/boosted_trees/unstack_7Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:7*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_7
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_7&trial18/boosted_trees/ExpandDims_7/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_8Unpack&transform/transform/sp2d-output_pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_8BoostedTreesBucketizetrial18/boosted_trees/unstack_8Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:8*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_8
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_8&trial18/boosted_trees/ExpandDims_8/dim*
T0*'
_output_shapes
:?????????

trial18/boosted_trees/unstack_9Unpacktransform/transform/sp2d-pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial18/boosted_trees/BoostedTreesBucketize_9BoostedTreesBucketizetrial18/boosted_trees/unstack_9Otrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:9*#
_output_shapes
:?????????*
num_features
h
&trial18/boosted_trees/ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial18/boosted_trees/ExpandDims_9
ExpandDims-trial18/boosted_trees/BoostedTreesBucketize_9&trial18/boosted_trees/ExpandDims_9/dim*
T0*'
_output_shapes
:?????????
]
trial18/boosted_trees/zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 
γ
#trial18/boosted_trees/SparseToDenseSparseToDenseGtrial18/boosted_trees/transform_features/preset/to_sparse_input/indicesKtrial18/boosted_trees/transform_features/preset/to_sparse_input/dense_shape8trial18/boosted_trees/transform_features/preset/SelectV2trial18/boosted_trees/zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????

trial18/boosted_trees/CastCast#trial18/boosted_trees/SparseToDense*

DstT0*

SrcT0	*'
_output_shapes
:?????????
Ή
)trial18/boosted_trees/BoostedTreesPredictBoostedTreesPredicttrial18/boosted_trees trial18/boosted_trees/ExpandDims"trial18/boosted_trees/ExpandDims_1"trial18/boosted_trees/ExpandDims_2"trial18/boosted_trees/ExpandDims_3"trial18/boosted_trees/ExpandDims_4"trial18/boosted_trees/ExpandDims_5"trial18/boosted_trees/ExpandDims_6"trial18/boosted_trees/ExpandDims_7"trial18/boosted_trees/ExpandDims_8"trial18/boosted_trees/ExpandDims_9trial18/boosted_trees/Cast*'
_output_shapes
:?????????*
logits_dimension*
num_bucketized_features

'trial18/boosted_trees/head/logits/ShapeShape)trial18/boosted_trees/BoostedTreesPredict*
T0*
_output_shapes
:
}
;trial18/boosted_trees/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
m
etrial18/boosted_trees/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
^
Vtrial18/boosted_trees/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
[
save_2/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_2/filenamePlaceholderWithDefaultsave_2/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_2/ConstPlaceholderWithDefaultsave_2/filename*
_output_shapes
: *
dtype0*
shape: 
±
save_2/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial18/boosted_trees:0_stampB"trial18/boosted_trees:0_serialized
}
save_2/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
ύ
save_2/SaveV2SaveV2save_2/Constsave_2/SaveV2/tensor_namessave_2/SaveV2/shape_and_slicesKtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial18/boosted_trees/BoostedTreesSerializeEnsemble5trial18/boosted_trees/BoostedTreesSerializeEnsemble:1*
dtypes
2	

save_2/control_dependencyIdentitysave_2/Const^save_2/SaveV2*
T0*
_class
loc:@save_2/Const*
_output_shapes
: 
΄
save_2/RestoreV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial18/boosted_trees:0_stampB"trial18/boosted_trees:0_serialized

!save_2/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
Ο
save_2/RestoreV2	RestoreV2save_2/Constsave_2/RestoreV2/tensor_names!save_2/RestoreV2/shape_and_slices*D
_output_shapes2
0::::::::::::*
dtypes
2	
Ύ
4save_2/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial18/boosted_trees/QuantileAccumulatorsave_2/RestoreV2save_2/RestoreV2:1save_2/RestoreV2:2save_2/RestoreV2:3save_2/RestoreV2:4save_2/RestoreV2:5save_2/RestoreV2:6save_2/RestoreV2:7save_2/RestoreV2:8save_2/RestoreV2:9S^trial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

½
&save_2/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial18/boosted_treessave_2/RestoreV2:10save_2/RestoreV2:111^trial18/boosted_trees/BoostedTreesCreateEnsemble
z
save_2/restore_allNoOp'^save_2/BoostedTreesDeserializeEnsemble5^save_2/BoostedTreesQuantileStreamResourceDeserialize
~
trial19/boosted_trees$BoostedTreesEnsembleResourceHandleOp*
_output_shapes
: *'
shared_nametrial19/boosted_trees/
~
<trial19/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenConst*
_output_shapes
: *
dtype0	*
value	B	 R 

Itrial19/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serializedConst*
_output_shapes
: *
dtype0*
valueB B 
ξ
0trial19/boosted_trees/BoostedTreesCreateEnsembleBoostedTreesCreateEnsembletrial19/boosted_trees<trial19/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenItrial19/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serialized

7trial19/boosted_trees/IsBoostedTreesEnsembleInitialized!IsBoostedTreesEnsembleInitializedtrial19/boosted_trees*
_output_shapes
: 

3trial19/boosted_trees/BoostedTreesSerializeEnsembleBoostedTreesSerializeEnsembletrial19/boosted_trees*
_output_shapes
: : 
¬
)trial19/boosted_trees/QuantileAccumulator*BoostedTreesQuantileStreamResourceHandleOp*
_output_shapes
: *;
shared_name,*trial19/boosted_trees/QuantileAccumulator/

Ztrial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *
Χ#<
 
^trial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streamsConst*
_output_shapes
: *
dtype0	*
value	B	 R

ε
Rtrial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource(BoostedTreesCreateQuantileStreamResource)trial19/boosted_trees/QuantileAccumulatorZtrial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilon^trial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streams
Ο
Ytrial19/boosted_trees/QuantileAccumulator/IsBoostedTreesQuantileStreamResourceInitialized/IsBoostedTreesQuantileStreamResourceInitialized)trial19/boosted_trees/QuantileAccumulator*
_output_shapes
: 
ς
Ktrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries5BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial19/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features

τ
Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_15BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial19/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features


Ntrial19/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/xConst*
_output_shapes
: *
dtype0*
valueB :
?????????
Τ
Ltrial19/boosted_trees/transform_features/preset/to_sparse_input/ignore_valueCastNtrial19/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/x*

DstT0	*

SrcT0*
_output_shapes
: 
γ
Htrial19/boosted_trees/transform_features/preset/to_sparse_input/NotEqualNotEqualSparseToDenseLtrial19/boosted_trees/transform_features/preset/to_sparse_input/ignore_value*
T0	*'
_output_shapes
:?????????
Γ
Gtrial19/boosted_trees/transform_features/preset/to_sparse_input/indicesWhereHtrial19/boosted_trees/transform_features/preset/to_sparse_input/NotEqual*'
_output_shapes
:?????????
ξ
Ftrial19/boosted_trees/transform_features/preset/to_sparse_input/valuesGatherNdSparseToDenseGtrial19/boosted_trees/transform_features/preset/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????

Ktrial19/boosted_trees/transform_features/preset/to_sparse_input/dense_shapeShapeSparseToDense*
T0	*
_output_shapes
:*
out_type0	

=trial19/boosted_trees/transform_features/preset/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :
²
;trial19/boosted_trees/transform_features/preset/num_bucketsCast=trial19/boosted_trees/transform_features/preset/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
x
6trial19/boosted_trees/transform_features/preset/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial19/boosted_trees/transform_features/preset/zeroCast6trial19/boosted_trees/transform_features/preset/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
θ
4trial19/boosted_trees/transform_features/preset/LessLessFtrial19/boosted_trees/transform_features/preset/to_sparse_input/values4trial19/boosted_trees/transform_features/preset/zero*
T0	*#
_output_shapes
:?????????
?
<trial19/boosted_trees/transform_features/preset/GreaterEqualGreaterEqualFtrial19/boosted_trees/transform_features/preset/to_sparse_input/values;trial19/boosted_trees/transform_features/preset/num_buckets*
T0	*#
_output_shapes
:?????????
β
<trial19/boosted_trees/transform_features/preset/out_of_range	LogicalOr4trial19/boosted_trees/transform_features/preset/Less<trial19/boosted_trees/transform_features/preset/GreaterEqual*#
_output_shapes
:?????????
«
5trial19/boosted_trees/transform_features/preset/ShapeShapeFtrial19/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*
_output_shapes
:
x
6trial19/boosted_trees/transform_features/preset/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial19/boosted_trees/transform_features/preset/CastCast6trial19/boosted_trees/transform_features/preset/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
α
>trial19/boosted_trees/transform_features/preset/default_valuesFill5trial19/boosted_trees/transform_features/preset/Shape4trial19/boosted_trees/transform_features/preset/Cast*
T0	*#
_output_shapes
:?????????
Έ
8trial19/boosted_trees/transform_features/preset/SelectV2SelectV2<trial19/boosted_trees/transform_features/preset/out_of_range>trial19/boosted_trees/transform_features/preset/default_valuesFtrial19/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*#
_output_shapes
:?????????

trial19/boosted_trees/unstackUnpacktransform/transform/sp2d-cores*
T0*#
_output_shapes
:?????????*

axis*	
num
λ
+trial19/boosted_trees/BoostedTreesBucketizeBoostedTreesBucketizetrial19/boosted_trees/unstackMtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1*#
_output_shapes
:?????????*
num_features
f
$trial19/boosted_trees/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :
³
 trial19/boosted_trees/ExpandDims
ExpandDims+trial19/boosted_trees/BoostedTreesBucketize$trial19/boosted_trees/ExpandDims/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_1Unpack*transform/transform/sp2d-downscaled_avg_si*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_1BoostedTreesBucketizetrial19/boosted_trees/unstack_1Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:1*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_1
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_1&trial19/boosted_trees/ExpandDims_1/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_2Unpack*transform/transform/sp2d-downscaled_avg_ti*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_2BoostedTreesBucketizetrial19/boosted_trees/unstack_2Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:2*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_2
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_2&trial19/boosted_trees/ExpandDims_2/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_3Unpack+transform/transform/sp2d-downscaled_bitrate*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_3BoostedTreesBucketizetrial19/boosted_trees/unstack_3Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:3*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_3
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_3&trial19/boosted_trees/ExpandDims_3/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_4Unpack!transform/transform/sp2d-duration*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_4BoostedTreesBucketizetrial19/boosted_trees/unstack_4Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:4*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_4
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_4&trial19/boosted_trees/ExpandDims_4/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_5Unpacktransform/transform/sp2d-fps*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_5BoostedTreesBucketizetrial19/boosted_trees/unstack_5Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:5*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_5
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_5&trial19/boosted_trees/ExpandDims_5/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_6Unpacktransform/transform/sp2d-height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_6BoostedTreesBucketizetrial19/boosted_trees/unstack_6Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:6*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_6
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_6&trial19/boosted_trees/ExpandDims_6/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_7Unpack&transform/transform/sp2d-output_height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_7BoostedTreesBucketizetrial19/boosted_trees/unstack_7Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:7*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_7
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_7&trial19/boosted_trees/ExpandDims_7/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_8Unpack&transform/transform/sp2d-output_pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_8BoostedTreesBucketizetrial19/boosted_trees/unstack_8Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:8*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_8
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_8&trial19/boosted_trees/ExpandDims_8/dim*
T0*'
_output_shapes
:?????????

trial19/boosted_trees/unstack_9Unpacktransform/transform/sp2d-pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial19/boosted_trees/BoostedTreesBucketize_9BoostedTreesBucketizetrial19/boosted_trees/unstack_9Otrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:9*#
_output_shapes
:?????????*
num_features
h
&trial19/boosted_trees/ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial19/boosted_trees/ExpandDims_9
ExpandDims-trial19/boosted_trees/BoostedTreesBucketize_9&trial19/boosted_trees/ExpandDims_9/dim*
T0*'
_output_shapes
:?????????
]
trial19/boosted_trees/zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 
γ
#trial19/boosted_trees/SparseToDenseSparseToDenseGtrial19/boosted_trees/transform_features/preset/to_sparse_input/indicesKtrial19/boosted_trees/transform_features/preset/to_sparse_input/dense_shape8trial19/boosted_trees/transform_features/preset/SelectV2trial19/boosted_trees/zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????

trial19/boosted_trees/CastCast#trial19/boosted_trees/SparseToDense*

DstT0*

SrcT0	*'
_output_shapes
:?????????
Ή
)trial19/boosted_trees/BoostedTreesPredictBoostedTreesPredicttrial19/boosted_trees trial19/boosted_trees/ExpandDims"trial19/boosted_trees/ExpandDims_1"trial19/boosted_trees/ExpandDims_2"trial19/boosted_trees/ExpandDims_3"trial19/boosted_trees/ExpandDims_4"trial19/boosted_trees/ExpandDims_5"trial19/boosted_trees/ExpandDims_6"trial19/boosted_trees/ExpandDims_7"trial19/boosted_trees/ExpandDims_8"trial19/boosted_trees/ExpandDims_9trial19/boosted_trees/Cast*'
_output_shapes
:?????????*
logits_dimension*
num_bucketized_features

'trial19/boosted_trees/head/logits/ShapeShape)trial19/boosted_trees/BoostedTreesPredict*
T0*
_output_shapes
:
}
;trial19/boosted_trees/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
m
etrial19/boosted_trees/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
^
Vtrial19/boosted_trees/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
[
save_3/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_3/filenamePlaceholderWithDefaultsave_3/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_3/ConstPlaceholderWithDefaultsave_3/filename*
_output_shapes
: *
dtype0*
shape: 
±
save_3/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial19/boosted_trees:0_stampB"trial19/boosted_trees:0_serialized
}
save_3/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
ύ
save_3/SaveV2SaveV2save_3/Constsave_3/SaveV2/tensor_namessave_3/SaveV2/shape_and_slicesKtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial19/boosted_trees/BoostedTreesSerializeEnsemble5trial19/boosted_trees/BoostedTreesSerializeEnsemble:1*
dtypes
2	

save_3/control_dependencyIdentitysave_3/Const^save_3/SaveV2*
T0*
_class
loc:@save_3/Const*
_output_shapes
: 
΄
save_3/RestoreV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial19/boosted_trees:0_stampB"trial19/boosted_trees:0_serialized

!save_3/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
Ο
save_3/RestoreV2	RestoreV2save_3/Constsave_3/RestoreV2/tensor_names!save_3/RestoreV2/shape_and_slices*D
_output_shapes2
0::::::::::::*
dtypes
2	
Ύ
4save_3/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial19/boosted_trees/QuantileAccumulatorsave_3/RestoreV2save_3/RestoreV2:1save_3/RestoreV2:2save_3/RestoreV2:3save_3/RestoreV2:4save_3/RestoreV2:5save_3/RestoreV2:6save_3/RestoreV2:7save_3/RestoreV2:8save_3/RestoreV2:9S^trial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

½
&save_3/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial19/boosted_treessave_3/RestoreV2:10save_3/RestoreV2:111^trial19/boosted_trees/BoostedTreesCreateEnsemble
z
save_3/restore_allNoOp'^save_3/BoostedTreesDeserializeEnsemble5^save_3/BoostedTreesQuantileStreamResourceDeserialize
~
trial20/boosted_trees$BoostedTreesEnsembleResourceHandleOp*
_output_shapes
: *'
shared_nametrial20/boosted_trees/
~
<trial20/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenConst*
_output_shapes
: *
dtype0	*
value	B	 R 

Itrial20/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serializedConst*
_output_shapes
: *
dtype0*
valueB B 
ξ
0trial20/boosted_trees/BoostedTreesCreateEnsembleBoostedTreesCreateEnsembletrial20/boosted_trees<trial20/boosted_trees/BoostedTreesCreateEnsemble/stamp_tokenItrial20/boosted_trees/BoostedTreesCreateEnsemble/tree_ensemble_serialized

7trial20/boosted_trees/IsBoostedTreesEnsembleInitialized!IsBoostedTreesEnsembleInitializedtrial20/boosted_trees*
_output_shapes
: 

3trial20/boosted_trees/BoostedTreesSerializeEnsembleBoostedTreesSerializeEnsembletrial20/boosted_trees*
_output_shapes
: : 
¬
)trial20/boosted_trees/QuantileAccumulator*BoostedTreesQuantileStreamResourceHandleOp*
_output_shapes
: *;
shared_name,*trial20/boosted_trees/QuantileAccumulator/

Ztrial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilonConst*
_output_shapes
: *
dtype0*
valueB
 *
Χ#<
 
^trial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streamsConst*
_output_shapes
: *
dtype0	*
value	B	 R

ε
Rtrial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource(BoostedTreesCreateQuantileStreamResource)trial20/boosted_trees/QuantileAccumulatorZtrial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/epsilon^trial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource/num_streams
Ο
Ytrial20/boosted_trees/QuantileAccumulator/IsBoostedTreesQuantileStreamResourceInitialized/IsBoostedTreesQuantileStreamResourceInitialized)trial20/boosted_trees/QuantileAccumulator*
_output_shapes
: 
ς
Ktrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries5BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial20/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features

τ
Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_15BoostedTreesQuantileStreamResourceGetBucketBoundaries)trial20/boosted_trees/QuantileAccumulator*¬
_output_shapes
:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
num_features


Ntrial20/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/xConst*
_output_shapes
: *
dtype0*
valueB :
?????????
Τ
Ltrial20/boosted_trees/transform_features/preset/to_sparse_input/ignore_valueCastNtrial20/boosted_trees/transform_features/preset/to_sparse_input/ignore_value/x*

DstT0	*

SrcT0*
_output_shapes
: 
γ
Htrial20/boosted_trees/transform_features/preset/to_sparse_input/NotEqualNotEqualSparseToDenseLtrial20/boosted_trees/transform_features/preset/to_sparse_input/ignore_value*
T0	*'
_output_shapes
:?????????
Γ
Gtrial20/boosted_trees/transform_features/preset/to_sparse_input/indicesWhereHtrial20/boosted_trees/transform_features/preset/to_sparse_input/NotEqual*'
_output_shapes
:?????????
ξ
Ftrial20/boosted_trees/transform_features/preset/to_sparse_input/valuesGatherNdSparseToDenseGtrial20/boosted_trees/transform_features/preset/to_sparse_input/indices*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????

Ktrial20/boosted_trees/transform_features/preset/to_sparse_input/dense_shapeShapeSparseToDense*
T0	*
_output_shapes
:*
out_type0	

=trial20/boosted_trees/transform_features/preset/num_buckets/xConst*
_output_shapes
: *
dtype0*
value	B :
²
;trial20/boosted_trees/transform_features/preset/num_bucketsCast=trial20/boosted_trees/transform_features/preset/num_buckets/x*

DstT0	*

SrcT0*
_output_shapes
: 
x
6trial20/boosted_trees/transform_features/preset/zero/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial20/boosted_trees/transform_features/preset/zeroCast6trial20/boosted_trees/transform_features/preset/zero/x*

DstT0	*

SrcT0*
_output_shapes
: 
θ
4trial20/boosted_trees/transform_features/preset/LessLessFtrial20/boosted_trees/transform_features/preset/to_sparse_input/values4trial20/boosted_trees/transform_features/preset/zero*
T0	*#
_output_shapes
:?????????
?
<trial20/boosted_trees/transform_features/preset/GreaterEqualGreaterEqualFtrial20/boosted_trees/transform_features/preset/to_sparse_input/values;trial20/boosted_trees/transform_features/preset/num_buckets*
T0	*#
_output_shapes
:?????????
β
<trial20/boosted_trees/transform_features/preset/out_of_range	LogicalOr4trial20/boosted_trees/transform_features/preset/Less<trial20/boosted_trees/transform_features/preset/GreaterEqual*#
_output_shapes
:?????????
«
5trial20/boosted_trees/transform_features/preset/ShapeShapeFtrial20/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*
_output_shapes
:
x
6trial20/boosted_trees/transform_features/preset/Cast/xConst*
_output_shapes
: *
dtype0*
value	B : 
€
4trial20/boosted_trees/transform_features/preset/CastCast6trial20/boosted_trees/transform_features/preset/Cast/x*

DstT0	*

SrcT0*
_output_shapes
: 
α
>trial20/boosted_trees/transform_features/preset/default_valuesFill5trial20/boosted_trees/transform_features/preset/Shape4trial20/boosted_trees/transform_features/preset/Cast*
T0	*#
_output_shapes
:?????????
Έ
8trial20/boosted_trees/transform_features/preset/SelectV2SelectV2<trial20/boosted_trees/transform_features/preset/out_of_range>trial20/boosted_trees/transform_features/preset/default_valuesFtrial20/boosted_trees/transform_features/preset/to_sparse_input/values*
T0	*#
_output_shapes
:?????????

trial20/boosted_trees/unstackUnpacktransform/transform/sp2d-cores*
T0*#
_output_shapes
:?????????*

axis*	
num
λ
+trial20/boosted_trees/BoostedTreesBucketizeBoostedTreesBucketizetrial20/boosted_trees/unstackMtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1*#
_output_shapes
:?????????*
num_features
f
$trial20/boosted_trees/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :
³
 trial20/boosted_trees/ExpandDims
ExpandDims+trial20/boosted_trees/BoostedTreesBucketize$trial20/boosted_trees/ExpandDims/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_1Unpack*transform/transform/sp2d-downscaled_avg_si*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_1BoostedTreesBucketizetrial20/boosted_trees/unstack_1Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:1*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_1
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_1&trial20/boosted_trees/ExpandDims_1/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_2Unpack*transform/transform/sp2d-downscaled_avg_ti*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_2BoostedTreesBucketizetrial20/boosted_trees/unstack_2Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:2*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_2
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_2&trial20/boosted_trees/ExpandDims_2/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_3Unpack+transform/transform/sp2d-downscaled_bitrate*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_3BoostedTreesBucketizetrial20/boosted_trees/unstack_3Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:3*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_3
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_3&trial20/boosted_trees/ExpandDims_3/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_4Unpack!transform/transform/sp2d-duration*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_4BoostedTreesBucketizetrial20/boosted_trees/unstack_4Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:4*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_4
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_4&trial20/boosted_trees/ExpandDims_4/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_5Unpacktransform/transform/sp2d-fps*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_5BoostedTreesBucketizetrial20/boosted_trees/unstack_5Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:5*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_5
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_5&trial20/boosted_trees/ExpandDims_5/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_6Unpacktransform/transform/sp2d-height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_6BoostedTreesBucketizetrial20/boosted_trees/unstack_6Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:6*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_6
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_6&trial20/boosted_trees/ExpandDims_6/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_7Unpack&transform/transform/sp2d-output_height*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_7BoostedTreesBucketizetrial20/boosted_trees/unstack_7Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:7*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_7
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_7&trial20/boosted_trees/ExpandDims_7/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_8Unpack&transform/transform/sp2d-output_pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_8BoostedTreesBucketizetrial20/boosted_trees/unstack_8Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:8*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_8
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_8&trial20/boosted_trees/ExpandDims_8/dim*
T0*'
_output_shapes
:?????????

trial20/boosted_trees/unstack_9Unpacktransform/transform/sp2d-pixels*
T0*#
_output_shapes
:?????????*

axis*	
num
ρ
-trial20/boosted_trees/BoostedTreesBucketize_9BoostedTreesBucketizetrial20/boosted_trees/unstack_9Otrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries_1:9*#
_output_shapes
:?????????*
num_features
h
&trial20/boosted_trees/ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
value	B :
Ή
"trial20/boosted_trees/ExpandDims_9
ExpandDims-trial20/boosted_trees/BoostedTreesBucketize_9&trial20/boosted_trees/ExpandDims_9/dim*
T0*'
_output_shapes
:?????????
]
trial20/boosted_trees/zerosConst*
_output_shapes
: *
dtype0	*
value	B	 R 
γ
#trial20/boosted_trees/SparseToDenseSparseToDenseGtrial20/boosted_trees/transform_features/preset/to_sparse_input/indicesKtrial20/boosted_trees/transform_features/preset/to_sparse_input/dense_shape8trial20/boosted_trees/transform_features/preset/SelectV2trial20/boosted_trees/zeros*
T0	*
Tindices0	*'
_output_shapes
:?????????

trial20/boosted_trees/CastCast#trial20/boosted_trees/SparseToDense*

DstT0*

SrcT0	*'
_output_shapes
:?????????
Ή
)trial20/boosted_trees/BoostedTreesPredictBoostedTreesPredicttrial20/boosted_trees trial20/boosted_trees/ExpandDims"trial20/boosted_trees/ExpandDims_1"trial20/boosted_trees/ExpandDims_2"trial20/boosted_trees/ExpandDims_3"trial20/boosted_trees/ExpandDims_4"trial20/boosted_trees/ExpandDims_5"trial20/boosted_trees/ExpandDims_6"trial20/boosted_trees/ExpandDims_7"trial20/boosted_trees/ExpandDims_8"trial20/boosted_trees/ExpandDims_9trial20/boosted_trees/Cast*'
_output_shapes
:?????????*
logits_dimension*
num_bucketized_features

'trial20/boosted_trees/head/logits/ShapeShape)trial20/boosted_trees/BoostedTreesPredict*
T0*
_output_shapes
:
}
;trial20/boosted_trees/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
dtype0*
value	B :
m
etrial20/boosted_trees/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
^
Vtrial20/boosted_trees/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
[
save_4/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_4/filenamePlaceholderWithDefaultsave_4/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_4/ConstPlaceholderWithDefaultsave_4/filename*
_output_shapes
: *
dtype0*
shape: 
±
save_4/SaveV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial20/boosted_trees:0_stampB"trial20/boosted_trees:0_serialized
}
save_4/SaveV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
ύ
save_4/SaveV2SaveV2save_4/Constsave_4/SaveV2/tensor_namessave_4/SaveV2/shape_and_slicesKtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial20/boosted_trees/BoostedTreesSerializeEnsemble5trial20/boosted_trees/BoostedTreesSerializeEnsemble:1*
dtypes
2	

save_4/control_dependencyIdentitysave_4/Const^save_4/SaveV2*
T0*
_class
loc:@save_4/Const*
_output_shapes
: 
΄
save_4/RestoreV2/tensor_namesConst*
_output_shapes
:*
dtype0*β
valueΨBΥB?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial20/boosted_trees:0_stampB"trial20/boosted_trees:0_serialized

!save_4/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
dtype0*+
value"B B B B B B B B B B B B B 
Ο
save_4/RestoreV2	RestoreV2save_4/Constsave_4/RestoreV2/tensor_names!save_4/RestoreV2/shape_and_slices*D
_output_shapes2
0::::::::::::*
dtypes
2	
Ύ
4save_4/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial20/boosted_trees/QuantileAccumulatorsave_4/RestoreV2save_4/RestoreV2:1save_4/RestoreV2:2save_4/RestoreV2:3save_4/RestoreV2:4save_4/RestoreV2:5save_4/RestoreV2:6save_4/RestoreV2:7save_4/RestoreV2:8save_4/RestoreV2:9S^trial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

½
&save_4/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial20/boosted_treessave_4/RestoreV2:10save_4/RestoreV2:111^trial20/boosted_trees/BoostedTreesCreateEnsemble
z
save_4/restore_allNoOp'^save_4/BoostedTreesDeserializeEnsemble5^save_4/BoostedTreesQuantileStreamResourceDeserialize
Ψ
AddNAddNIdentity
Identity_1
Identity_2
Identity_3
Identity_4)trial16/boosted_trees/BoostedTreesPredict)trial17/boosted_trees/BoostedTreesPredict)trial18/boosted_trees/BoostedTreesPredict)trial19/boosted_trees/BoostedTreesPredict)trial20/boosted_trees/BoostedTreesPredict*
N
*
T0*'
_output_shapes
:?????????
K
	ToFloat/xConst*
_output_shapes
: *
dtype0*
value	B :

J
ToFloatCast	ToFloat/x*

DstT0*

SrcT0*
_output_shapes
: 
S
truedivRealDivAddNToFloat*
T0*'
_output_shapes
:?????????

initNoOp
f
init_all_tablesNoOpM^transform/transform/apply_vocab/text_file_init/InitializeTableFromTextFileV2

init_1NoOp
6
group_deps_5NoOp^init^init_1^init_all_tables
[
save_5/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
r
save_5/filenamePlaceholderWithDefaultsave_5/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_5/ConstPlaceholderWithDefaultsave_5/filename*
_output_shapes
: *
dtype0*
shape: 
p
save_5/StaticRegexFullMatchStaticRegexFullMatchsave_5/Const*
_output_shapes
: *
pattern
^s3://.*
T
save_5/Const_1Const*
_output_shapes
: *
dtype0*
valueB B.part
Y
save_5/Const_2Const*
_output_shapes
: *
dtype0*
valueB B
_temp/part
u
save_5/SelectSelectsave_5/StaticRegexFullMatchsave_5/Const_1save_5/Const_2*
T0*
_output_shapes
: 
]
save_5/StringJoin
StringJoinsave_5/Constsave_5/Select*
N*
_output_shapes
: 
S
save_5/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
^
save_5/ShardedFilename/shardConst*
_output_shapes
: *
dtype0*
value	B : 

save_5/ShardedFilenameShardedFilenamesave_5/StringJoinsave_5/ShardedFilename/shardsave_5/num_shards*
_output_shapes
: 
½'
save_5/SaveV2/tensor_namesConst*
_output_shapes
:t*
dtype0*ξ&
valueδ&Bα&tBglobal_stepBtrial1/dense/biasBtrial1/dense/kernelBtrial1/dense_1/biasBtrial1/dense_1/kernelBtrial1/dense_2/biasBtrial1/dense_2/kernelBtrial1/dense_3/biasBtrial1/dense_3/kernelBtrial1/dense_4/biasBtrial1/dense_4/kernelB5trial1/input_layer/preset_embedding/embedding_weightsB?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial16/boosted_trees:0_stampB"trial16/boosted_trees:0_serializedB?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial17/boosted_trees:0_stampB"trial17/boosted_trees:0_serializedB?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial18/boosted_trees:0_stampB"trial18/boosted_trees:0_serializedB?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial19/boosted_trees:0_stampB"trial19/boosted_trees:0_serializedBtrial2/dense/biasBtrial2/dense/kernelBtrial2/dense_1/biasBtrial2/dense_1/kernelBtrial2/dense_2/biasBtrial2/dense_2/kernelBtrial2/dense_3/biasBtrial2/dense_3/kernelBtrial2/dense_4/biasBtrial2/dense_4/kernelB5trial2/input_layer/preset_embedding/embedding_weightsB?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial20/boosted_trees:0_stampB"trial20/boosted_trees:0_serializedBtrial3/dense/biasBtrial3/dense/kernelBtrial3/dense_1/biasBtrial3/dense_1/kernelBtrial3/dense_2/biasBtrial3/dense_2/kernelBtrial3/dense_3/biasBtrial3/dense_3/kernelBtrial3/dense_4/biasBtrial3/dense_4/kernelB5trial3/input_layer/preset_embedding/embedding_weightsBtrial4/dense/biasBtrial4/dense/kernelBtrial4/dense_1/biasBtrial4/dense_1/kernelBtrial4/dense_2/biasBtrial4/dense_2/kernelBtrial4/dense_3/biasBtrial4/dense_3/kernelBtrial4/dense_4/biasBtrial4/dense_4/kernelB5trial4/input_layer/preset_embedding/embedding_weightsBtrial5/dense/biasBtrial5/dense/kernelBtrial5/dense_1/biasBtrial5/dense_1/kernelBtrial5/dense_2/biasBtrial5/dense_2/kernelBtrial5/dense_3/biasBtrial5/dense_3/kernelBtrial5/dense_4/biasBtrial5/dense_4/kernelB5trial5/input_layer/preset_embedding/embedding_weights
Π
save_5/SaveV2/shape_and_slicesConst*
_output_shapes
:t*
dtype0*ύ
valueσBπtB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
¨8
save_5/SaveV2SaveV2save_5/ShardedFilenamesave_5/SaveV2/tensor_namessave_5/SaveV2/shape_and_slicesglobal_step/Read/ReadVariableOp%trial1/dense/bias/Read/ReadVariableOp'trial1/dense/kernel/Read/ReadVariableOp'trial1/dense_1/bias/Read/ReadVariableOp)trial1/dense_1/kernel/Read/ReadVariableOp'trial1/dense_2/bias/Read/ReadVariableOp)trial1/dense_2/kernel/Read/ReadVariableOp'trial1/dense_3/bias/Read/ReadVariableOp)trial1/dense_3/kernel/Read/ReadVariableOp'trial1/dense_4/bias/Read/ReadVariableOp)trial1/dense_4/kernel/Read/ReadVariableOpItrial1/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpKtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial16/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial16/boosted_trees/BoostedTreesSerializeEnsemble5trial16/boosted_trees/BoostedTreesSerializeEnsemble:1Ktrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial17/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial17/boosted_trees/BoostedTreesSerializeEnsemble5trial17/boosted_trees/BoostedTreesSerializeEnsemble:1Ktrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial18/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial18/boosted_trees/BoostedTreesSerializeEnsemble5trial18/boosted_trees/BoostedTreesSerializeEnsemble:1Ktrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial19/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial19/boosted_trees/BoostedTreesSerializeEnsemble5trial19/boosted_trees/BoostedTreesSerializeEnsemble:1%trial2/dense/bias/Read/ReadVariableOp'trial2/dense/kernel/Read/ReadVariableOp'trial2/dense_1/bias/Read/ReadVariableOp)trial2/dense_1/kernel/Read/ReadVariableOp'trial2/dense_2/bias/Read/ReadVariableOp)trial2/dense_2/kernel/Read/ReadVariableOp'trial2/dense_3/bias/Read/ReadVariableOp)trial2/dense_3/kernel/Read/ReadVariableOp'trial2/dense_4/bias/Read/ReadVariableOp)trial2/dense_4/kernel/Read/ReadVariableOpItrial2/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOpKtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundariesMtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:1Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:2Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:3Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:4Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:5Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:6Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:7Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:8Mtrial20/boosted_trees/BoostedTreesQuantileStreamResourceGetBucketBoundaries:93trial20/boosted_trees/BoostedTreesSerializeEnsemble5trial20/boosted_trees/BoostedTreesSerializeEnsemble:1%trial3/dense/bias/Read/ReadVariableOp'trial3/dense/kernel/Read/ReadVariableOp'trial3/dense_1/bias/Read/ReadVariableOp)trial3/dense_1/kernel/Read/ReadVariableOp'trial3/dense_2/bias/Read/ReadVariableOp)trial3/dense_2/kernel/Read/ReadVariableOp'trial3/dense_3/bias/Read/ReadVariableOp)trial3/dense_3/kernel/Read/ReadVariableOp'trial3/dense_4/bias/Read/ReadVariableOp)trial3/dense_4/kernel/Read/ReadVariableOpItrial3/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp%trial4/dense/bias/Read/ReadVariableOp'trial4/dense/kernel/Read/ReadVariableOp'trial4/dense_1/bias/Read/ReadVariableOp)trial4/dense_1/kernel/Read/ReadVariableOp'trial4/dense_2/bias/Read/ReadVariableOp)trial4/dense_2/kernel/Read/ReadVariableOp'trial4/dense_3/bias/Read/ReadVariableOp)trial4/dense_3/kernel/Read/ReadVariableOp'trial4/dense_4/bias/Read/ReadVariableOp)trial4/dense_4/kernel/Read/ReadVariableOpItrial4/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp%trial5/dense/bias/Read/ReadVariableOp'trial5/dense/kernel/Read/ReadVariableOp'trial5/dense_1/bias/Read/ReadVariableOp)trial5/dense_1/kernel/Read/ReadVariableOp'trial5/dense_2/bias/Read/ReadVariableOp)trial5/dense_2/kernel/Read/ReadVariableOp'trial5/dense_3/bias/Read/ReadVariableOp)trial5/dense_3/kernel/Read/ReadVariableOp'trial5/dense_4/bias/Read/ReadVariableOp)trial5/dense_4/kernel/Read/ReadVariableOpItrial5/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp*
dtypesx
v2t						

save_5/control_dependencyIdentitysave_5/ShardedFilename^save_5/SaveV2*
T0*)
_class
loc:@save_5/ShardedFilename*
_output_shapes
: 

-save_5/MergeV2Checkpoints/checkpoint_prefixesPacksave_5/ShardedFilename^save_5/control_dependency*
N*
T0*
_output_shapes
:
l
save_5/MergeV2CheckpointsMergeV2Checkpoints-save_5/MergeV2Checkpoints/checkpoint_prefixessave_5/Const

save_5/IdentityIdentitysave_5/Const^save_5/MergeV2Checkpoints^save_5/control_dependency*
T0*
_output_shapes
: 
ΐ'
save_5/RestoreV2/tensor_namesConst*
_output_shapes
:t*
dtype0*ξ&
valueδ&Bα&tBglobal_stepBtrial1/dense/biasBtrial1/dense/kernelBtrial1/dense_1/biasBtrial1/dense_1/kernelBtrial1/dense_2/biasBtrial1/dense_2/kernelBtrial1/dense_3/biasBtrial1/dense_3/kernelBtrial1/dense_4/biasBtrial1/dense_4/kernelB5trial1/input_layer/preset_embedding/embedding_weightsB?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial16/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial16/boosted_trees:0_stampB"trial16/boosted_trees:0_serializedB?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial17/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial17/boosted_trees:0_stampB"trial17/boosted_trees:0_serializedB?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial18/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial18/boosted_trees:0_stampB"trial18/boosted_trees:0_serializedB?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial19/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial19/boosted_trees:0_stampB"trial19/boosted_trees:0_serializedBtrial2/dense/biasBtrial2/dense/kernelBtrial2/dense_1/biasBtrial2/dense_1/kernelBtrial2/dense_2/biasBtrial2/dense_2/kernelBtrial2/dense_3/biasBtrial2/dense_3/kernelBtrial2/dense_4/biasBtrial2/dense_4/kernelB5trial2/input_layer/preset_embedding/embedding_weightsB?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_0B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_1B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_2B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_3B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_4B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_5B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_6B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_7B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_8B?trial20/boosted_trees/QuantileAccumulator:0_bucket_boundaries_9Btrial20/boosted_trees:0_stampB"trial20/boosted_trees:0_serializedBtrial3/dense/biasBtrial3/dense/kernelBtrial3/dense_1/biasBtrial3/dense_1/kernelBtrial3/dense_2/biasBtrial3/dense_2/kernelBtrial3/dense_3/biasBtrial3/dense_3/kernelBtrial3/dense_4/biasBtrial3/dense_4/kernelB5trial3/input_layer/preset_embedding/embedding_weightsBtrial4/dense/biasBtrial4/dense/kernelBtrial4/dense_1/biasBtrial4/dense_1/kernelBtrial4/dense_2/biasBtrial4/dense_2/kernelBtrial4/dense_3/biasBtrial4/dense_3/kernelBtrial4/dense_4/biasBtrial4/dense_4/kernelB5trial4/input_layer/preset_embedding/embedding_weightsBtrial5/dense/biasBtrial5/dense/kernelBtrial5/dense_1/biasBtrial5/dense_1/kernelBtrial5/dense_2/biasBtrial5/dense_2/kernelBtrial5/dense_3/biasBtrial5/dense_3/kernelBtrial5/dense_4/biasBtrial5/dense_4/kernelB5trial5/input_layer/preset_embedding/embedding_weights
Σ
!save_5/RestoreV2/shape_and_slicesConst*
_output_shapes
:t*
dtype0*ύ
valueσBπtB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
Ϋ
save_5/RestoreV2	RestoreV2save_5/Constsave_5/RestoreV2/tensor_names!save_5/RestoreV2/shape_and_slices*ζ
_output_shapesΣ
Π::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypesx
v2t						
R
save_5/Identity_1Identitysave_5/RestoreV2*
T0	*
_output_shapes
:
X
save_5/AssignVariableOpAssignVariableOpglobal_stepsave_5/Identity_1*
dtype0	
T
save_5/Identity_2Identitysave_5/RestoreV2:1*
T0*
_output_shapes
:
`
save_5/AssignVariableOp_1AssignVariableOptrial1/dense/biassave_5/Identity_2*
dtype0
T
save_5/Identity_3Identitysave_5/RestoreV2:2*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_2AssignVariableOptrial1/dense/kernelsave_5/Identity_3*
dtype0
T
save_5/Identity_4Identitysave_5/RestoreV2:3*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_3AssignVariableOptrial1/dense_1/biassave_5/Identity_4*
dtype0
T
save_5/Identity_5Identitysave_5/RestoreV2:4*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_4AssignVariableOptrial1/dense_1/kernelsave_5/Identity_5*
dtype0
T
save_5/Identity_6Identitysave_5/RestoreV2:5*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_5AssignVariableOptrial1/dense_2/biassave_5/Identity_6*
dtype0
T
save_5/Identity_7Identitysave_5/RestoreV2:6*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_6AssignVariableOptrial1/dense_2/kernelsave_5/Identity_7*
dtype0
T
save_5/Identity_8Identitysave_5/RestoreV2:7*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_7AssignVariableOptrial1/dense_3/biassave_5/Identity_8*
dtype0
T
save_5/Identity_9Identitysave_5/RestoreV2:8*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_8AssignVariableOptrial1/dense_3/kernelsave_5/Identity_9*
dtype0
U
save_5/Identity_10Identitysave_5/RestoreV2:9*
T0*
_output_shapes
:
c
save_5/AssignVariableOp_9AssignVariableOptrial1/dense_4/biassave_5/Identity_10*
dtype0
V
save_5/Identity_11Identitysave_5/RestoreV2:10*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_10AssignVariableOptrial1/dense_4/kernelsave_5/Identity_11*
dtype0
V
save_5/Identity_12Identitysave_5/RestoreV2:11*
T0*
_output_shapes
:

save_5/AssignVariableOp_11AssignVariableOp5trial1/input_layer/preset_embedding/embedding_weightssave_5/Identity_12*
dtype0
Κ
4save_5/BoostedTreesQuantileStreamResourceDeserialize-BoostedTreesQuantileStreamResourceDeserialize)trial16/boosted_trees/QuantileAccumulatorsave_5/RestoreV2:12save_5/RestoreV2:13save_5/RestoreV2:14save_5/RestoreV2:15save_5/RestoreV2:16save_5/RestoreV2:17save_5/RestoreV2:18save_5/RestoreV2:19save_5/RestoreV2:20save_5/RestoreV2:21S^trial16/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

½
&save_5/BoostedTreesDeserializeEnsembleBoostedTreesDeserializeEnsembletrial16/boosted_treessave_5/RestoreV2:22save_5/RestoreV2:231^trial16/boosted_trees/BoostedTreesCreateEnsemble
Μ
6save_5/BoostedTreesQuantileStreamResourceDeserialize_1-BoostedTreesQuantileStreamResourceDeserialize)trial17/boosted_trees/QuantileAccumulatorsave_5/RestoreV2:24save_5/RestoreV2:25save_5/RestoreV2:26save_5/RestoreV2:27save_5/RestoreV2:28save_5/RestoreV2:29save_5/RestoreV2:30save_5/RestoreV2:31save_5/RestoreV2:32save_5/RestoreV2:33S^trial17/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

Ώ
(save_5/BoostedTreesDeserializeEnsemble_1BoostedTreesDeserializeEnsembletrial17/boosted_treessave_5/RestoreV2:34save_5/RestoreV2:351^trial17/boosted_trees/BoostedTreesCreateEnsemble
Μ
6save_5/BoostedTreesQuantileStreamResourceDeserialize_2-BoostedTreesQuantileStreamResourceDeserialize)trial18/boosted_trees/QuantileAccumulatorsave_5/RestoreV2:36save_5/RestoreV2:37save_5/RestoreV2:38save_5/RestoreV2:39save_5/RestoreV2:40save_5/RestoreV2:41save_5/RestoreV2:42save_5/RestoreV2:43save_5/RestoreV2:44save_5/RestoreV2:45S^trial18/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

Ώ
(save_5/BoostedTreesDeserializeEnsemble_2BoostedTreesDeserializeEnsembletrial18/boosted_treessave_5/RestoreV2:46save_5/RestoreV2:471^trial18/boosted_trees/BoostedTreesCreateEnsemble
Μ
6save_5/BoostedTreesQuantileStreamResourceDeserialize_3-BoostedTreesQuantileStreamResourceDeserialize)trial19/boosted_trees/QuantileAccumulatorsave_5/RestoreV2:48save_5/RestoreV2:49save_5/RestoreV2:50save_5/RestoreV2:51save_5/RestoreV2:52save_5/RestoreV2:53save_5/RestoreV2:54save_5/RestoreV2:55save_5/RestoreV2:56save_5/RestoreV2:57S^trial19/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

Ώ
(save_5/BoostedTreesDeserializeEnsemble_3BoostedTreesDeserializeEnsembletrial19/boosted_treessave_5/RestoreV2:58save_5/RestoreV2:591^trial19/boosted_trees/BoostedTreesCreateEnsemble
V
save_5/Identity_13Identitysave_5/RestoreV2:60*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_12AssignVariableOptrial2/dense/biassave_5/Identity_13*
dtype0
V
save_5/Identity_14Identitysave_5/RestoreV2:61*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_13AssignVariableOptrial2/dense/kernelsave_5/Identity_14*
dtype0
V
save_5/Identity_15Identitysave_5/RestoreV2:62*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_14AssignVariableOptrial2/dense_1/biassave_5/Identity_15*
dtype0
V
save_5/Identity_16Identitysave_5/RestoreV2:63*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_15AssignVariableOptrial2/dense_1/kernelsave_5/Identity_16*
dtype0
V
save_5/Identity_17Identitysave_5/RestoreV2:64*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_16AssignVariableOptrial2/dense_2/biassave_5/Identity_17*
dtype0
V
save_5/Identity_18Identitysave_5/RestoreV2:65*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_17AssignVariableOptrial2/dense_2/kernelsave_5/Identity_18*
dtype0
V
save_5/Identity_19Identitysave_5/RestoreV2:66*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_18AssignVariableOptrial2/dense_3/biassave_5/Identity_19*
dtype0
V
save_5/Identity_20Identitysave_5/RestoreV2:67*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_19AssignVariableOptrial2/dense_3/kernelsave_5/Identity_20*
dtype0
V
save_5/Identity_21Identitysave_5/RestoreV2:68*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_20AssignVariableOptrial2/dense_4/biassave_5/Identity_21*
dtype0
V
save_5/Identity_22Identitysave_5/RestoreV2:69*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_21AssignVariableOptrial2/dense_4/kernelsave_5/Identity_22*
dtype0
V
save_5/Identity_23Identitysave_5/RestoreV2:70*
T0*
_output_shapes
:

save_5/AssignVariableOp_22AssignVariableOp5trial2/input_layer/preset_embedding/embedding_weightssave_5/Identity_23*
dtype0
Μ
6save_5/BoostedTreesQuantileStreamResourceDeserialize_4-BoostedTreesQuantileStreamResourceDeserialize)trial20/boosted_trees/QuantileAccumulatorsave_5/RestoreV2:71save_5/RestoreV2:72save_5/RestoreV2:73save_5/RestoreV2:74save_5/RestoreV2:75save_5/RestoreV2:76save_5/RestoreV2:77save_5/RestoreV2:78save_5/RestoreV2:79save_5/RestoreV2:80S^trial20/boosted_trees/QuantileAccumulator/BoostedTreesCreateQuantileStreamResource*
num_streams

Ώ
(save_5/BoostedTreesDeserializeEnsemble_4BoostedTreesDeserializeEnsembletrial20/boosted_treessave_5/RestoreV2:81save_5/RestoreV2:821^trial20/boosted_trees/BoostedTreesCreateEnsemble
V
save_5/Identity_24Identitysave_5/RestoreV2:83*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_23AssignVariableOptrial3/dense/biassave_5/Identity_24*
dtype0
V
save_5/Identity_25Identitysave_5/RestoreV2:84*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_24AssignVariableOptrial3/dense/kernelsave_5/Identity_25*
dtype0
V
save_5/Identity_26Identitysave_5/RestoreV2:85*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_25AssignVariableOptrial3/dense_1/biassave_5/Identity_26*
dtype0
V
save_5/Identity_27Identitysave_5/RestoreV2:86*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_26AssignVariableOptrial3/dense_1/kernelsave_5/Identity_27*
dtype0
V
save_5/Identity_28Identitysave_5/RestoreV2:87*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_27AssignVariableOptrial3/dense_2/biassave_5/Identity_28*
dtype0
V
save_5/Identity_29Identitysave_5/RestoreV2:88*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_28AssignVariableOptrial3/dense_2/kernelsave_5/Identity_29*
dtype0
V
save_5/Identity_30Identitysave_5/RestoreV2:89*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_29AssignVariableOptrial3/dense_3/biassave_5/Identity_30*
dtype0
V
save_5/Identity_31Identitysave_5/RestoreV2:90*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_30AssignVariableOptrial3/dense_3/kernelsave_5/Identity_31*
dtype0
V
save_5/Identity_32Identitysave_5/RestoreV2:91*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_31AssignVariableOptrial3/dense_4/biassave_5/Identity_32*
dtype0
V
save_5/Identity_33Identitysave_5/RestoreV2:92*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_32AssignVariableOptrial3/dense_4/kernelsave_5/Identity_33*
dtype0
V
save_5/Identity_34Identitysave_5/RestoreV2:93*
T0*
_output_shapes
:

save_5/AssignVariableOp_33AssignVariableOp5trial3/input_layer/preset_embedding/embedding_weightssave_5/Identity_34*
dtype0
V
save_5/Identity_35Identitysave_5/RestoreV2:94*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_34AssignVariableOptrial4/dense/biassave_5/Identity_35*
dtype0
V
save_5/Identity_36Identitysave_5/RestoreV2:95*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_35AssignVariableOptrial4/dense/kernelsave_5/Identity_36*
dtype0
V
save_5/Identity_37Identitysave_5/RestoreV2:96*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_36AssignVariableOptrial4/dense_1/biassave_5/Identity_37*
dtype0
V
save_5/Identity_38Identitysave_5/RestoreV2:97*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_37AssignVariableOptrial4/dense_1/kernelsave_5/Identity_38*
dtype0
V
save_5/Identity_39Identitysave_5/RestoreV2:98*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_38AssignVariableOptrial4/dense_2/biassave_5/Identity_39*
dtype0
V
save_5/Identity_40Identitysave_5/RestoreV2:99*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_39AssignVariableOptrial4/dense_2/kernelsave_5/Identity_40*
dtype0
W
save_5/Identity_41Identitysave_5/RestoreV2:100*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_40AssignVariableOptrial4/dense_3/biassave_5/Identity_41*
dtype0
W
save_5/Identity_42Identitysave_5/RestoreV2:101*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_41AssignVariableOptrial4/dense_3/kernelsave_5/Identity_42*
dtype0
W
save_5/Identity_43Identitysave_5/RestoreV2:102*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_42AssignVariableOptrial4/dense_4/biassave_5/Identity_43*
dtype0
W
save_5/Identity_44Identitysave_5/RestoreV2:103*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_43AssignVariableOptrial4/dense_4/kernelsave_5/Identity_44*
dtype0
W
save_5/Identity_45Identitysave_5/RestoreV2:104*
T0*
_output_shapes
:

save_5/AssignVariableOp_44AssignVariableOp5trial4/input_layer/preset_embedding/embedding_weightssave_5/Identity_45*
dtype0
W
save_5/Identity_46Identitysave_5/RestoreV2:105*
T0*
_output_shapes
:
b
save_5/AssignVariableOp_45AssignVariableOptrial5/dense/biassave_5/Identity_46*
dtype0
W
save_5/Identity_47Identitysave_5/RestoreV2:106*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_46AssignVariableOptrial5/dense/kernelsave_5/Identity_47*
dtype0
W
save_5/Identity_48Identitysave_5/RestoreV2:107*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_47AssignVariableOptrial5/dense_1/biassave_5/Identity_48*
dtype0
W
save_5/Identity_49Identitysave_5/RestoreV2:108*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_48AssignVariableOptrial5/dense_1/kernelsave_5/Identity_49*
dtype0
W
save_5/Identity_50Identitysave_5/RestoreV2:109*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_49AssignVariableOptrial5/dense_2/biassave_5/Identity_50*
dtype0
W
save_5/Identity_51Identitysave_5/RestoreV2:110*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_50AssignVariableOptrial5/dense_2/kernelsave_5/Identity_51*
dtype0
W
save_5/Identity_52Identitysave_5/RestoreV2:111*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_51AssignVariableOptrial5/dense_3/biassave_5/Identity_52*
dtype0
W
save_5/Identity_53Identitysave_5/RestoreV2:112*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_52AssignVariableOptrial5/dense_3/kernelsave_5/Identity_53*
dtype0
W
save_5/Identity_54Identitysave_5/RestoreV2:113*
T0*
_output_shapes
:
d
save_5/AssignVariableOp_53AssignVariableOptrial5/dense_4/biassave_5/Identity_54*
dtype0
W
save_5/Identity_55Identitysave_5/RestoreV2:114*
T0*
_output_shapes
:
f
save_5/AssignVariableOp_54AssignVariableOptrial5/dense_4/kernelsave_5/Identity_55*
dtype0
W
save_5/Identity_56Identitysave_5/RestoreV2:115*
T0*
_output_shapes
:

save_5/AssignVariableOp_55AssignVariableOp5trial5/input_layer/preset_embedding/embedding_weightssave_5/Identity_56*
dtype0
Ψ
save_5/restore_shardNoOp^save_5/AssignVariableOp^save_5/AssignVariableOp_1^save_5/AssignVariableOp_10^save_5/AssignVariableOp_11^save_5/AssignVariableOp_12^save_5/AssignVariableOp_13^save_5/AssignVariableOp_14^save_5/AssignVariableOp_15^save_5/AssignVariableOp_16^save_5/AssignVariableOp_17^save_5/AssignVariableOp_18^save_5/AssignVariableOp_19^save_5/AssignVariableOp_2^save_5/AssignVariableOp_20^save_5/AssignVariableOp_21^save_5/AssignVariableOp_22^save_5/AssignVariableOp_23^save_5/AssignVariableOp_24^save_5/AssignVariableOp_25^save_5/AssignVariableOp_26^save_5/AssignVariableOp_27^save_5/AssignVariableOp_28^save_5/AssignVariableOp_29^save_5/AssignVariableOp_3^save_5/AssignVariableOp_30^save_5/AssignVariableOp_31^save_5/AssignVariableOp_32^save_5/AssignVariableOp_33^save_5/AssignVariableOp_34^save_5/AssignVariableOp_35^save_5/AssignVariableOp_36^save_5/AssignVariableOp_37^save_5/AssignVariableOp_38^save_5/AssignVariableOp_39^save_5/AssignVariableOp_4^save_5/AssignVariableOp_40^save_5/AssignVariableOp_41^save_5/AssignVariableOp_42^save_5/AssignVariableOp_43^save_5/AssignVariableOp_44^save_5/AssignVariableOp_45^save_5/AssignVariableOp_46^save_5/AssignVariableOp_47^save_5/AssignVariableOp_48^save_5/AssignVariableOp_49^save_5/AssignVariableOp_5^save_5/AssignVariableOp_50^save_5/AssignVariableOp_51^save_5/AssignVariableOp_52^save_5/AssignVariableOp_53^save_5/AssignVariableOp_54^save_5/AssignVariableOp_55^save_5/AssignVariableOp_6^save_5/AssignVariableOp_7^save_5/AssignVariableOp_8^save_5/AssignVariableOp_9'^save_5/BoostedTreesDeserializeEnsemble)^save_5/BoostedTreesDeserializeEnsemble_1)^save_5/BoostedTreesDeserializeEnsemble_2)^save_5/BoostedTreesDeserializeEnsemble_3)^save_5/BoostedTreesDeserializeEnsemble_45^save_5/BoostedTreesQuantileStreamResourceDeserialize7^save_5/BoostedTreesQuantileStreamResourceDeserialize_17^save_5/BoostedTreesQuantileStreamResourceDeserialize_27^save_5/BoostedTreesQuantileStreamResourceDeserialize_37^save_5/BoostedTreesQuantileStreamResourceDeserialize_4
1
save_5/restore_allNoOp^save_5/restore_shardΙ
Σ
j
__inference__traced_save_7624
file_prefix
savev2_const

identity_1’MergeV2Checkpoints
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard¦
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
SaveV2/shape_and_slicesΊ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0savev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
22
SaveV2Ί
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes‘
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*
_input_shapes
: : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: 
―
F
 __inference__traced_restore_6963
file_prefix

identity_1€
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
RestoreV2/shape_and_slices°
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*
_output_shapes
:*
dtypes
22
	RestoreV29
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOpd
IdentityIdentityfile_prefix^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2

IdentityX

Identity_1IdentityIdentity:output:0*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*
_input_shapes
: :C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
ΰ
£
cond_true_10030A
=transform_transform_sparsefillemptyrows_sparsefillemptyrows_0	I
Etransform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2_0	<
8transform_transform_inputs_inputs_preset_preset_2_copy_0	?
;transform_transform_sparsefillemptyrows_sparsefillemptyrows	G
Ctransform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2	:
6transform_transform_inputs_inputs_preset_preset_2_copy	"
Ctransform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2Etransform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2_0"r
6transform_transform_inputs_inputs_preset_preset_2_copy8transform_transform_inputs_inputs_preset_preset_2_copy_0"|
;transform_transform_sparsefillemptyrows_sparsefillemptyrows=transform_transform_sparsefillemptyrows_sparsefillemptyrows_0*;
_input_shapes*
(:?????????:?????????::- )
'
_output_shapes
:?????????:)%
#
_output_shapes
:?????????: 

_output_shapes
:
Ρ

__inference_decode_record_7607

record
identity	

identity_1

identity_2	

identity_3	

identity_4

identity_5	

identity_6	

identity_7

identity_8	

identity_9	
identity_10
identity_11	
identity_12	
identity_13
identity_14	
identity_15	
identity_16
identity_17	
identity_18	
identity_19
identity_20	
identity_21	
identity_22
identity_23	
identity_24	
identity_25
identity_26	
identity_27	
identity_28
identity_29	
identity_30	
identity_31
identity_32	
identity_33	
identity_34
identity_35	M
SizeSizerecord*
T0*
_output_shapes
: *
out_type0	2
Size
DecodeProtoSparseV2DecodeProtoSparseV2record*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
struct_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2£
DecodeProtoSparseV2_1DecodeProtoSparseV2DecodeProtoSparseV2:values:0*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names

fields*(
message_typegoogle.protobuf.Struct*

num_fields*
output_types
22
DecodeProtoSparseV2_1
DecodeProtoMapDecodeProtoMapDecodeProtoSparseV2_1:values:0DecodeProtoSparseV2_1:indices:0*ώ
_output_shapesλ
θ:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
keys
pixelsdownscaled_avg_sioutput_pixelsdurationcoresdownscaled_avg_tittpresetheightdownscaled_bitrateoutput_heightfps*4
message_type$"google.protobuf.Struct.FieldsEntry*
num_keys*
output_type02
DecodeProtoMap£
DecodeProtoSparseV2_2DecodeProtoSparseV2DecodeProtoMap:values:0*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_2£
DecodeProtoSparseV2_3DecodeProtoSparseV2DecodeProtoMap:values:1*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_3£
DecodeProtoSparseV2_4DecodeProtoSparseV2DecodeProtoMap:values:2*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_4£
DecodeProtoSparseV2_5DecodeProtoSparseV2DecodeProtoMap:values:3*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_5£
DecodeProtoSparseV2_6DecodeProtoSparseV2DecodeProtoMap:values:4*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_6£
DecodeProtoSparseV2_7DecodeProtoSparseV2DecodeProtoMap:values:5*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_7£
DecodeProtoSparseV2_8DecodeProtoSparseV2DecodeProtoMap:values:6*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_8£
DecodeProtoSparseV2_9DecodeProtoSparseV2DecodeProtoMap:values:7*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_9₯
DecodeProtoSparseV2_10DecodeProtoSparseV2DecodeProtoMap:values:8*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_10₯
DecodeProtoSparseV2_11DecodeProtoSparseV2DecodeProtoMap:values:9*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_11¦
DecodeProtoSparseV2_12DecodeProtoSparseV2DecodeProtoMap:values:10*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_12¦
DecodeProtoSparseV2_13DecodeProtoSparseV2DecodeProtoMap:values:11*2
_output_shapes 
:?????????:?????????*
descriptor_literal
ώ
google/protobuf/struct.protogoogle.protobuf"
Struct3
fields (2#.google.protobuf.Struct.FieldsEntryE
FieldsEntry
key (	%
value (2.google.protobuf.Value:8"κ
Value0

null_value (2.google.protobuf.NullValueH 
number_value (H 
string_value (	H 

bool_value (H /
struct_value (2.google.protobuf.StructH 0

list_value (2.google.protobuf.ListValueH B
kind"3
	ListValue&
values (2.google.protobuf.Value*
	NullValue

NULL_VALUE B
com.google.protobufBStructProtoPZ/google.golang.org/protobuf/types/known/structpbψ’GPBͺGoogle.Protobuf.WellKnownTypesbproto3*
field_names
string_value*'
message_typegoogle.protobuf.Value*

num_fields*
output_types
22
DecodeProtoSparseV2_13c
Size_1SizeDecodeProtoMap:indices:4*
T0	*
_output_shapes
: *
out_type0	2
Size_1h
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape/shapek
ReshapeReshapeSize_1:output:0Reshape/shape:output:0*
T0	*
_output_shapes
:2	
Reshape{
RunLengthBeforeRunLengthBeforeDecodeProtoSparseV2_6:indices:0*#
_output_shapes
:?????????2
RunLengthBeforeX
ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Constg
MaxMax#RunLengthBefore:run_length_before:0Const:output:0*
T0	*
_output_shapes
: 2
MaxP
add/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2
add/yR
addAddV2Max:output:0add/y:output:0*
T0	*
_output_shapes
: 2
addl
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_1/shapei
	Reshape_1Reshapeadd:z:0Reshape_1/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_1`
	Maximum/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
	Maximum/yj
MaximumMaximumReshape_1:output:0Maximum/y:output:0*
T0	*
_output_shapes
:2	
Maximumh
Size_2SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2
Size_2l
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_2/shapeq
	Reshape_2ReshapeSize_2:output:0Reshape_2/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_2x
RunLengthBefore_1RunLengthBeforeDecodeProtoMap:indices:4*#
_output_shapes
:?????????2
RunLengthBefore_1\
Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_1o
Max_1Max%RunLengthBefore_1:run_length_before:0Const_1:output:0*
T0	*
_output_shapes
: 2
Max_1T
add_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_1/yZ
add_1AddV2Max_1:output:0add_1/y:output:0*
T0	*
_output_shapes
: 2
add_1l
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_3/shapek
	Reshape_3Reshape	add_1:z:0Reshape_3/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_3d
Maximum_1/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_1/yp
	Maximum_1MaximumReshape_3:output:0Maximum_1/y:output:0*
T0	*
_output_shapes
:2
	Maximum_1l
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_4/shapeo
	Reshape_4ReshapeSize:output:0Reshape_4/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_4}
RunLengthBefore_2RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_2\
Const_2Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_2o
Max_2Max%RunLengthBefore_2:run_length_before:0Const_2:output:0*
T0	*
_output_shapes
: 2
Max_2T
add_2/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_2/yZ
add_2AddV2Max_2:output:0add_2/y:output:0*
T0	*
_output_shapes
: 2
add_2l
Reshape_5/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_5/shapek
	Reshape_5Reshape	add_2:z:0Reshape_5/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_5d
Maximum_2/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_2/yp
	Maximum_2MaximumReshape_5:output:0Maximum_2/y:output:0*
T0	*
_output_shapes
:2
	Maximum_2k
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims/dim

ExpandDims
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims/dim:output:0*
T0	*'
_output_shapes
:?????????2

ExpandDims`
GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2/axisΌ
GatherV2GatherV2ExpandDims:output:0DecodeProtoMap:indices:4GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2d
GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_1/axisΗ

GatherV2_1GatherV2GatherV2:output:0DecodeProtoSparseV2_6:indices:0GatherV2_1/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_1c
Size_3SizeDecodeProtoMap:indices:1*
T0	*
_output_shapes
: *
out_type0	2
Size_3l
Reshape_6/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_6/shapeq
	Reshape_6ReshapeSize_3:output:0Reshape_6/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_6
RunLengthBefore_3RunLengthBeforeDecodeProtoSparseV2_3:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_3\
Const_3Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_3o
Max_3Max%RunLengthBefore_3:run_length_before:0Const_3:output:0*
T0	*
_output_shapes
: 2
Max_3T
add_3/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_3/yZ
add_3AddV2Max_3:output:0add_3/y:output:0*
T0	*
_output_shapes
: 2
add_3l
Reshape_7/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_7/shapek
	Reshape_7Reshape	add_3:z:0Reshape_7/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_7d
Maximum_3/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_3/yp
	Maximum_3MaximumReshape_7:output:0Maximum_3/y:output:0*
T0	*
_output_shapes
:2
	Maximum_3h
Size_4SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2
Size_4l
Reshape_8/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_8/shapeq
	Reshape_8ReshapeSize_4:output:0Reshape_8/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_8x
RunLengthBefore_4RunLengthBeforeDecodeProtoMap:indices:1*#
_output_shapes
:?????????2
RunLengthBefore_4\
Const_4Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_4o
Max_4Max%RunLengthBefore_4:run_length_before:0Const_4:output:0*
T0	*
_output_shapes
: 2
Max_4T
add_4/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_4/yZ
add_4AddV2Max_4:output:0add_4/y:output:0*
T0	*
_output_shapes
: 2
add_4l
Reshape_9/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_9/shapek
	Reshape_9Reshape	add_4:z:0Reshape_9/shape:output:0*
T0	*
_output_shapes
:2
	Reshape_9d
Maximum_4/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_4/yp
	Maximum_4MaximumReshape_9:output:0Maximum_4/y:output:0*
T0	*
_output_shapes
:2
	Maximum_4n
Reshape_10/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_10/shaper

Reshape_10ReshapeSize:output:0Reshape_10/shape:output:0*
T0	*
_output_shapes
:2

Reshape_10}
RunLengthBefore_5RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_5\
Const_5Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_5o
Max_5Max%RunLengthBefore_5:run_length_before:0Const_5:output:0*
T0	*
_output_shapes
: 2
Max_5T
add_5/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_5/yZ
add_5AddV2Max_5:output:0add_5/y:output:0*
T0	*
_output_shapes
: 2
add_5n
Reshape_11/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_11/shapen

Reshape_11Reshape	add_5:z:0Reshape_11/shape:output:0*
T0	*
_output_shapes
:2

Reshape_11d
Maximum_5/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_5/yq
	Maximum_5MaximumReshape_11:output:0Maximum_5/y:output:0*
T0	*
_output_shapes
:2
	Maximum_5o
ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_1/dim
ExpandDims_1
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_1/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_1d
GatherV2_2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_2/axisΔ

GatherV2_2GatherV2ExpandDims_1:output:0DecodeProtoMap:indices:1GatherV2_2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_2d
GatherV2_3/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_3/axisΙ

GatherV2_3GatherV2GatherV2_2:output:0DecodeProtoSparseV2_3:indices:0GatherV2_3/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_3c
Size_5SizeDecodeProtoMap:indices:5*
T0	*
_output_shapes
: *
out_type0	2
Size_5n
Reshape_12/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_12/shapet

Reshape_12ReshapeSize_5:output:0Reshape_12/shape:output:0*
T0	*
_output_shapes
:2

Reshape_12
RunLengthBefore_6RunLengthBeforeDecodeProtoSparseV2_7:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_6\
Const_6Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_6o
Max_6Max%RunLengthBefore_6:run_length_before:0Const_6:output:0*
T0	*
_output_shapes
: 2
Max_6T
add_6/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_6/yZ
add_6AddV2Max_6:output:0add_6/y:output:0*
T0	*
_output_shapes
: 2
add_6n
Reshape_13/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_13/shapen

Reshape_13Reshape	add_6:z:0Reshape_13/shape:output:0*
T0	*
_output_shapes
:2

Reshape_13d
Maximum_6/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_6/yq
	Maximum_6MaximumReshape_13:output:0Maximum_6/y:output:0*
T0	*
_output_shapes
:2
	Maximum_6h
Size_6SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2
Size_6n
Reshape_14/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_14/shapet

Reshape_14ReshapeSize_6:output:0Reshape_14/shape:output:0*
T0	*
_output_shapes
:2

Reshape_14x
RunLengthBefore_7RunLengthBeforeDecodeProtoMap:indices:5*#
_output_shapes
:?????????2
RunLengthBefore_7\
Const_7Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_7o
Max_7Max%RunLengthBefore_7:run_length_before:0Const_7:output:0*
T0	*
_output_shapes
: 2
Max_7T
add_7/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_7/yZ
add_7AddV2Max_7:output:0add_7/y:output:0*
T0	*
_output_shapes
: 2
add_7n
Reshape_15/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_15/shapen

Reshape_15Reshape	add_7:z:0Reshape_15/shape:output:0*
T0	*
_output_shapes
:2

Reshape_15d
Maximum_7/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_7/yq
	Maximum_7MaximumReshape_15:output:0Maximum_7/y:output:0*
T0	*
_output_shapes
:2
	Maximum_7n
Reshape_16/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_16/shaper

Reshape_16ReshapeSize:output:0Reshape_16/shape:output:0*
T0	*
_output_shapes
:2

Reshape_16}
RunLengthBefore_8RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_8\
Const_8Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_8o
Max_8Max%RunLengthBefore_8:run_length_before:0Const_8:output:0*
T0	*
_output_shapes
: 2
Max_8T
add_8/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_8/yZ
add_8AddV2Max_8:output:0add_8/y:output:0*
T0	*
_output_shapes
: 2
add_8n
Reshape_17/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_17/shapen

Reshape_17Reshape	add_8:z:0Reshape_17/shape:output:0*
T0	*
_output_shapes
:2

Reshape_17d
Maximum_8/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_8/yq
	Maximum_8MaximumReshape_17:output:0Maximum_8/y:output:0*
T0	*
_output_shapes
:2
	Maximum_8o
ExpandDims_2/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_2/dim
ExpandDims_2
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_2/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_2d
GatherV2_4/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_4/axisΔ

GatherV2_4GatherV2ExpandDims_2:output:0DecodeProtoMap:indices:5GatherV2_4/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_4d
GatherV2_5/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_5/axisΙ

GatherV2_5GatherV2GatherV2_4:output:0DecodeProtoSparseV2_7:indices:0GatherV2_5/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_5c
Size_7SizeDecodeProtoMap:indices:9*
T0	*
_output_shapes
: *
out_type0	2
Size_7n
Reshape_18/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_18/shapet

Reshape_18ReshapeSize_7:output:0Reshape_18/shape:output:0*
T0	*
_output_shapes
:2

Reshape_18
RunLengthBefore_9RunLengthBefore DecodeProtoSparseV2_11:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_9\
Const_9Const*
_output_shapes
:*
dtype0*
valueB: 2	
Const_9o
Max_9Max%RunLengthBefore_9:run_length_before:0Const_9:output:0*
T0	*
_output_shapes
: 2
Max_9T
add_9/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2	
add_9/yZ
add_9AddV2Max_9:output:0add_9/y:output:0*
T0	*
_output_shapes
: 2
add_9n
Reshape_19/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_19/shapen

Reshape_19Reshape	add_9:z:0Reshape_19/shape:output:0*
T0	*
_output_shapes
:2

Reshape_19d
Maximum_9/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_9/yq
	Maximum_9MaximumReshape_19:output:0Maximum_9/y:output:0*
T0	*
_output_shapes
:2
	Maximum_9h
Size_8SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2
Size_8n
Reshape_20/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_20/shapet

Reshape_20ReshapeSize_8:output:0Reshape_20/shape:output:0*
T0	*
_output_shapes
:2

Reshape_20z
RunLengthBefore_10RunLengthBeforeDecodeProtoMap:indices:9*#
_output_shapes
:?????????2
RunLengthBefore_10^
Const_10Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_10s
Max_10Max&RunLengthBefore_10:run_length_before:0Const_10:output:0*
T0	*
_output_shapes
: 2
Max_10V
add_10/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_10/y^
add_10AddV2Max_10:output:0add_10/y:output:0*
T0	*
_output_shapes
: 2
add_10n
Reshape_21/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_21/shapeo

Reshape_21Reshape
add_10:z:0Reshape_21/shape:output:0*
T0	*
_output_shapes
:2

Reshape_21f
Maximum_10/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_10/yt

Maximum_10MaximumReshape_21:output:0Maximum_10/y:output:0*
T0	*
_output_shapes
:2

Maximum_10n
Reshape_22/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_22/shaper

Reshape_22ReshapeSize:output:0Reshape_22/shape:output:0*
T0	*
_output_shapes
:2

Reshape_22
RunLengthBefore_11RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_11^
Const_11Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_11s
Max_11Max&RunLengthBefore_11:run_length_before:0Const_11:output:0*
T0	*
_output_shapes
: 2
Max_11V
add_11/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_11/y^
add_11AddV2Max_11:output:0add_11/y:output:0*
T0	*
_output_shapes
: 2
add_11n
Reshape_23/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_23/shapeo

Reshape_23Reshape
add_11:z:0Reshape_23/shape:output:0*
T0	*
_output_shapes
:2

Reshape_23f
Maximum_11/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_11/yt

Maximum_11MaximumReshape_23:output:0Maximum_11/y:output:0*
T0	*
_output_shapes
:2

Maximum_11o
ExpandDims_3/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_3/dim
ExpandDims_3
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_3/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_3d
GatherV2_6/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_6/axisΔ

GatherV2_6GatherV2ExpandDims_3:output:0DecodeProtoMap:indices:9GatherV2_6/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_6d
GatherV2_7/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_7/axisΚ

GatherV2_7GatherV2GatherV2_6:output:0 DecodeProtoSparseV2_11:indices:0GatherV2_7/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_7c
Size_9SizeDecodeProtoMap:indices:3*
T0	*
_output_shapes
: *
out_type0	2
Size_9n
Reshape_24/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_24/shapet

Reshape_24ReshapeSize_9:output:0Reshape_24/shape:output:0*
T0	*
_output_shapes
:2

Reshape_24
RunLengthBefore_12RunLengthBeforeDecodeProtoSparseV2_5:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_12^
Const_12Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_12s
Max_12Max&RunLengthBefore_12:run_length_before:0Const_12:output:0*
T0	*
_output_shapes
: 2
Max_12V
add_12/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_12/y^
add_12AddV2Max_12:output:0add_12/y:output:0*
T0	*
_output_shapes
: 2
add_12n
Reshape_25/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_25/shapeo

Reshape_25Reshape
add_12:z:0Reshape_25/shape:output:0*
T0	*
_output_shapes
:2

Reshape_25f
Maximum_12/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_12/yt

Maximum_12MaximumReshape_25:output:0Maximum_12/y:output:0*
T0	*
_output_shapes
:2

Maximum_12j
Size_10SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_10n
Reshape_26/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_26/shapeu

Reshape_26ReshapeSize_10:output:0Reshape_26/shape:output:0*
T0	*
_output_shapes
:2

Reshape_26z
RunLengthBefore_13RunLengthBeforeDecodeProtoMap:indices:3*#
_output_shapes
:?????????2
RunLengthBefore_13^
Const_13Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_13s
Max_13Max&RunLengthBefore_13:run_length_before:0Const_13:output:0*
T0	*
_output_shapes
: 2
Max_13V
add_13/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_13/y^
add_13AddV2Max_13:output:0add_13/y:output:0*
T0	*
_output_shapes
: 2
add_13n
Reshape_27/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_27/shapeo

Reshape_27Reshape
add_13:z:0Reshape_27/shape:output:0*
T0	*
_output_shapes
:2

Reshape_27f
Maximum_13/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_13/yt

Maximum_13MaximumReshape_27:output:0Maximum_13/y:output:0*
T0	*
_output_shapes
:2

Maximum_13n
Reshape_28/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_28/shaper

Reshape_28ReshapeSize:output:0Reshape_28/shape:output:0*
T0	*
_output_shapes
:2

Reshape_28
RunLengthBefore_14RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_14^
Const_14Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_14s
Max_14Max&RunLengthBefore_14:run_length_before:0Const_14:output:0*
T0	*
_output_shapes
: 2
Max_14V
add_14/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_14/y^
add_14AddV2Max_14:output:0add_14/y:output:0*
T0	*
_output_shapes
: 2
add_14n
Reshape_29/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_29/shapeo

Reshape_29Reshape
add_14:z:0Reshape_29/shape:output:0*
T0	*
_output_shapes
:2

Reshape_29f
Maximum_14/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_14/yt

Maximum_14MaximumReshape_29:output:0Maximum_14/y:output:0*
T0	*
_output_shapes
:2

Maximum_14o
ExpandDims_4/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_4/dim
ExpandDims_4
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_4/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_4d
GatherV2_8/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_8/axisΔ

GatherV2_8GatherV2ExpandDims_4:output:0DecodeProtoMap:indices:3GatherV2_8/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_8d
GatherV2_9/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_9/axisΙ

GatherV2_9GatherV2GatherV2_8:output:0DecodeProtoSparseV2_5:indices:0GatherV2_9/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2

GatherV2_9f
Size_11SizeDecodeProtoMap:indices:11*
T0	*
_output_shapes
: *
out_type0	2	
Size_11n
Reshape_30/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_30/shapeu

Reshape_30ReshapeSize_11:output:0Reshape_30/shape:output:0*
T0	*
_output_shapes
:2

Reshape_30
RunLengthBefore_15RunLengthBefore DecodeProtoSparseV2_13:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_15^
Const_15Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_15s
Max_15Max&RunLengthBefore_15:run_length_before:0Const_15:output:0*
T0	*
_output_shapes
: 2
Max_15V
add_15/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_15/y^
add_15AddV2Max_15:output:0add_15/y:output:0*
T0	*
_output_shapes
: 2
add_15n
Reshape_31/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_31/shapeo

Reshape_31Reshape
add_15:z:0Reshape_31/shape:output:0*
T0	*
_output_shapes
:2

Reshape_31f
Maximum_15/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_15/yt

Maximum_15MaximumReshape_31:output:0Maximum_15/y:output:0*
T0	*
_output_shapes
:2

Maximum_15j
Size_12SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_12n
Reshape_32/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_32/shapeu

Reshape_32ReshapeSize_12:output:0Reshape_32/shape:output:0*
T0	*
_output_shapes
:2

Reshape_32{
RunLengthBefore_16RunLengthBeforeDecodeProtoMap:indices:11*#
_output_shapes
:?????????2
RunLengthBefore_16^
Const_16Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_16s
Max_16Max&RunLengthBefore_16:run_length_before:0Const_16:output:0*
T0	*
_output_shapes
: 2
Max_16V
add_16/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_16/y^
add_16AddV2Max_16:output:0add_16/y:output:0*
T0	*
_output_shapes
: 2
add_16n
Reshape_33/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_33/shapeo

Reshape_33Reshape
add_16:z:0Reshape_33/shape:output:0*
T0	*
_output_shapes
:2

Reshape_33f
Maximum_16/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_16/yt

Maximum_16MaximumReshape_33:output:0Maximum_16/y:output:0*
T0	*
_output_shapes
:2

Maximum_16n
Reshape_34/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_34/shaper

Reshape_34ReshapeSize:output:0Reshape_34/shape:output:0*
T0	*
_output_shapes
:2

Reshape_34
RunLengthBefore_17RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_17^
Const_17Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_17s
Max_17Max&RunLengthBefore_17:run_length_before:0Const_17:output:0*
T0	*
_output_shapes
: 2
Max_17V
add_17/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_17/y^
add_17AddV2Max_17:output:0add_17/y:output:0*
T0	*
_output_shapes
: 2
add_17n
Reshape_35/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_35/shapeo

Reshape_35Reshape
add_17:z:0Reshape_35/shape:output:0*
T0	*
_output_shapes
:2

Reshape_35f
Maximum_17/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_17/yt

Maximum_17MaximumReshape_35:output:0Maximum_17/y:output:0*
T0	*
_output_shapes
:2

Maximum_17o
ExpandDims_5/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_5/dim
ExpandDims_5
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_5/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_5f
GatherV2_10/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_10/axisΘ
GatherV2_10GatherV2ExpandDims_5:output:0DecodeProtoMap:indices:11GatherV2_10/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_10f
GatherV2_11/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_11/axisΞ
GatherV2_11GatherV2GatherV2_10:output:0 DecodeProtoSparseV2_13:indices:0GatherV2_11/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_11e
Size_13SizeDecodeProtoMap:indices:8*
T0	*
_output_shapes
: *
out_type0	2	
Size_13n
Reshape_36/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_36/shapeu

Reshape_36ReshapeSize_13:output:0Reshape_36/shape:output:0*
T0	*
_output_shapes
:2

Reshape_36
RunLengthBefore_18RunLengthBefore DecodeProtoSparseV2_10:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_18^
Const_18Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_18s
Max_18Max&RunLengthBefore_18:run_length_before:0Const_18:output:0*
T0	*
_output_shapes
: 2
Max_18V
add_18/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_18/y^
add_18AddV2Max_18:output:0add_18/y:output:0*
T0	*
_output_shapes
: 2
add_18n
Reshape_37/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_37/shapeo

Reshape_37Reshape
add_18:z:0Reshape_37/shape:output:0*
T0	*
_output_shapes
:2

Reshape_37f
Maximum_18/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_18/yt

Maximum_18MaximumReshape_37:output:0Maximum_18/y:output:0*
T0	*
_output_shapes
:2

Maximum_18j
Size_14SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_14n
Reshape_38/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_38/shapeu

Reshape_38ReshapeSize_14:output:0Reshape_38/shape:output:0*
T0	*
_output_shapes
:2

Reshape_38z
RunLengthBefore_19RunLengthBeforeDecodeProtoMap:indices:8*#
_output_shapes
:?????????2
RunLengthBefore_19^
Const_19Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_19s
Max_19Max&RunLengthBefore_19:run_length_before:0Const_19:output:0*
T0	*
_output_shapes
: 2
Max_19V
add_19/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_19/y^
add_19AddV2Max_19:output:0add_19/y:output:0*
T0	*
_output_shapes
: 2
add_19n
Reshape_39/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_39/shapeo

Reshape_39Reshape
add_19:z:0Reshape_39/shape:output:0*
T0	*
_output_shapes
:2

Reshape_39f
Maximum_19/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_19/yt

Maximum_19MaximumReshape_39:output:0Maximum_19/y:output:0*
T0	*
_output_shapes
:2

Maximum_19n
Reshape_40/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_40/shaper

Reshape_40ReshapeSize:output:0Reshape_40/shape:output:0*
T0	*
_output_shapes
:2

Reshape_40
RunLengthBefore_20RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_20^
Const_20Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_20s
Max_20Max&RunLengthBefore_20:run_length_before:0Const_20:output:0*
T0	*
_output_shapes
: 2
Max_20V
add_20/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_20/y^
add_20AddV2Max_20:output:0add_20/y:output:0*
T0	*
_output_shapes
: 2
add_20n
Reshape_41/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_41/shapeo

Reshape_41Reshape
add_20:z:0Reshape_41/shape:output:0*
T0	*
_output_shapes
:2

Reshape_41f
Maximum_20/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_20/yt

Maximum_20MaximumReshape_41:output:0Maximum_20/y:output:0*
T0	*
_output_shapes
:2

Maximum_20o
ExpandDims_6/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_6/dim
ExpandDims_6
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_6/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_6f
GatherV2_12/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_12/axisΗ
GatherV2_12GatherV2ExpandDims_6:output:0DecodeProtoMap:indices:8GatherV2_12/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_12f
GatherV2_13/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_13/axisΞ
GatherV2_13GatherV2GatherV2_12:output:0 DecodeProtoSparseV2_10:indices:0GatherV2_13/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_13f
Size_15SizeDecodeProtoMap:indices:10*
T0	*
_output_shapes
: *
out_type0	2	
Size_15n
Reshape_42/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_42/shapeu

Reshape_42ReshapeSize_15:output:0Reshape_42/shape:output:0*
T0	*
_output_shapes
:2

Reshape_42
RunLengthBefore_21RunLengthBefore DecodeProtoSparseV2_12:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_21^
Const_21Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_21s
Max_21Max&RunLengthBefore_21:run_length_before:0Const_21:output:0*
T0	*
_output_shapes
: 2
Max_21V
add_21/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_21/y^
add_21AddV2Max_21:output:0add_21/y:output:0*
T0	*
_output_shapes
: 2
add_21n
Reshape_43/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_43/shapeo

Reshape_43Reshape
add_21:z:0Reshape_43/shape:output:0*
T0	*
_output_shapes
:2

Reshape_43f
Maximum_21/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_21/yt

Maximum_21MaximumReshape_43:output:0Maximum_21/y:output:0*
T0	*
_output_shapes
:2

Maximum_21j
Size_16SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_16n
Reshape_44/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_44/shapeu

Reshape_44ReshapeSize_16:output:0Reshape_44/shape:output:0*
T0	*
_output_shapes
:2

Reshape_44{
RunLengthBefore_22RunLengthBeforeDecodeProtoMap:indices:10*#
_output_shapes
:?????????2
RunLengthBefore_22^
Const_22Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_22s
Max_22Max&RunLengthBefore_22:run_length_before:0Const_22:output:0*
T0	*
_output_shapes
: 2
Max_22V
add_22/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_22/y^
add_22AddV2Max_22:output:0add_22/y:output:0*
T0	*
_output_shapes
: 2
add_22n
Reshape_45/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_45/shapeo

Reshape_45Reshape
add_22:z:0Reshape_45/shape:output:0*
T0	*
_output_shapes
:2

Reshape_45f
Maximum_22/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_22/yt

Maximum_22MaximumReshape_45:output:0Maximum_22/y:output:0*
T0	*
_output_shapes
:2

Maximum_22n
Reshape_46/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_46/shaper

Reshape_46ReshapeSize:output:0Reshape_46/shape:output:0*
T0	*
_output_shapes
:2

Reshape_46
RunLengthBefore_23RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_23^
Const_23Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_23s
Max_23Max&RunLengthBefore_23:run_length_before:0Const_23:output:0*
T0	*
_output_shapes
: 2
Max_23V
add_23/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_23/y^
add_23AddV2Max_23:output:0add_23/y:output:0*
T0	*
_output_shapes
: 2
add_23n
Reshape_47/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_47/shapeo

Reshape_47Reshape
add_23:z:0Reshape_47/shape:output:0*
T0	*
_output_shapes
:2

Reshape_47f
Maximum_23/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_23/yt

Maximum_23MaximumReshape_47:output:0Maximum_23/y:output:0*
T0	*
_output_shapes
:2

Maximum_23o
ExpandDims_7/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_7/dim
ExpandDims_7
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_7/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_7f
GatherV2_14/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_14/axisΘ
GatherV2_14GatherV2ExpandDims_7:output:0DecodeProtoMap:indices:10GatherV2_14/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_14f
GatherV2_15/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_15/axisΞ
GatherV2_15GatherV2GatherV2_14:output:0 DecodeProtoSparseV2_12:indices:0GatherV2_15/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_15e
Size_17SizeDecodeProtoMap:indices:2*
T0	*
_output_shapes
: *
out_type0	2	
Size_17n
Reshape_48/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_48/shapeu

Reshape_48ReshapeSize_17:output:0Reshape_48/shape:output:0*
T0	*
_output_shapes
:2

Reshape_48
RunLengthBefore_24RunLengthBeforeDecodeProtoSparseV2_4:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_24^
Const_24Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_24s
Max_24Max&RunLengthBefore_24:run_length_before:0Const_24:output:0*
T0	*
_output_shapes
: 2
Max_24V
add_24/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_24/y^
add_24AddV2Max_24:output:0add_24/y:output:0*
T0	*
_output_shapes
: 2
add_24n
Reshape_49/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_49/shapeo

Reshape_49Reshape
add_24:z:0Reshape_49/shape:output:0*
T0	*
_output_shapes
:2

Reshape_49f
Maximum_24/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_24/yt

Maximum_24MaximumReshape_49:output:0Maximum_24/y:output:0*
T0	*
_output_shapes
:2

Maximum_24j
Size_18SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_18n
Reshape_50/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_50/shapeu

Reshape_50ReshapeSize_18:output:0Reshape_50/shape:output:0*
T0	*
_output_shapes
:2

Reshape_50z
RunLengthBefore_25RunLengthBeforeDecodeProtoMap:indices:2*#
_output_shapes
:?????????2
RunLengthBefore_25^
Const_25Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_25s
Max_25Max&RunLengthBefore_25:run_length_before:0Const_25:output:0*
T0	*
_output_shapes
: 2
Max_25V
add_25/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_25/y^
add_25AddV2Max_25:output:0add_25/y:output:0*
T0	*
_output_shapes
: 2
add_25n
Reshape_51/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_51/shapeo

Reshape_51Reshape
add_25:z:0Reshape_51/shape:output:0*
T0	*
_output_shapes
:2

Reshape_51f
Maximum_25/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_25/yt

Maximum_25MaximumReshape_51:output:0Maximum_25/y:output:0*
T0	*
_output_shapes
:2

Maximum_25n
Reshape_52/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_52/shaper

Reshape_52ReshapeSize:output:0Reshape_52/shape:output:0*
T0	*
_output_shapes
:2

Reshape_52
RunLengthBefore_26RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_26^
Const_26Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_26s
Max_26Max&RunLengthBefore_26:run_length_before:0Const_26:output:0*
T0	*
_output_shapes
: 2
Max_26V
add_26/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_26/y^
add_26AddV2Max_26:output:0add_26/y:output:0*
T0	*
_output_shapes
: 2
add_26n
Reshape_53/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_53/shapeo

Reshape_53Reshape
add_26:z:0Reshape_53/shape:output:0*
T0	*
_output_shapes
:2

Reshape_53f
Maximum_26/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_26/yt

Maximum_26MaximumReshape_53:output:0Maximum_26/y:output:0*
T0	*
_output_shapes
:2

Maximum_26o
ExpandDims_8/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_8/dim
ExpandDims_8
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_8/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_8f
GatherV2_16/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_16/axisΗ
GatherV2_16GatherV2ExpandDims_8:output:0DecodeProtoMap:indices:2GatherV2_16/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_16f
GatherV2_17/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_17/axisΝ
GatherV2_17GatherV2GatherV2_16:output:0DecodeProtoSparseV2_4:indices:0GatherV2_17/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_17e
Size_19SizeDecodeProtoMap:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_19n
Reshape_54/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_54/shapeu

Reshape_54ReshapeSize_19:output:0Reshape_54/shape:output:0*
T0	*
_output_shapes
:2

Reshape_54
RunLengthBefore_27RunLengthBeforeDecodeProtoSparseV2_2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_27^
Const_27Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_27s
Max_27Max&RunLengthBefore_27:run_length_before:0Const_27:output:0*
T0	*
_output_shapes
: 2
Max_27V
add_27/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_27/y^
add_27AddV2Max_27:output:0add_27/y:output:0*
T0	*
_output_shapes
: 2
add_27n
Reshape_55/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_55/shapeo

Reshape_55Reshape
add_27:z:0Reshape_55/shape:output:0*
T0	*
_output_shapes
:2

Reshape_55f
Maximum_27/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_27/yt

Maximum_27MaximumReshape_55:output:0Maximum_27/y:output:0*
T0	*
_output_shapes
:2

Maximum_27j
Size_20SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_20n
Reshape_56/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_56/shapeu

Reshape_56ReshapeSize_20:output:0Reshape_56/shape:output:0*
T0	*
_output_shapes
:2

Reshape_56z
RunLengthBefore_28RunLengthBeforeDecodeProtoMap:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_28^
Const_28Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_28s
Max_28Max&RunLengthBefore_28:run_length_before:0Const_28:output:0*
T0	*
_output_shapes
: 2
Max_28V
add_28/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_28/y^
add_28AddV2Max_28:output:0add_28/y:output:0*
T0	*
_output_shapes
: 2
add_28n
Reshape_57/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_57/shapeo

Reshape_57Reshape
add_28:z:0Reshape_57/shape:output:0*
T0	*
_output_shapes
:2

Reshape_57f
Maximum_28/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_28/yt

Maximum_28MaximumReshape_57:output:0Maximum_28/y:output:0*
T0	*
_output_shapes
:2

Maximum_28n
Reshape_58/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_58/shaper

Reshape_58ReshapeSize:output:0Reshape_58/shape:output:0*
T0	*
_output_shapes
:2

Reshape_58
RunLengthBefore_29RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_29^
Const_29Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_29s
Max_29Max&RunLengthBefore_29:run_length_before:0Const_29:output:0*
T0	*
_output_shapes
: 2
Max_29V
add_29/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_29/y^
add_29AddV2Max_29:output:0add_29/y:output:0*
T0	*
_output_shapes
: 2
add_29n
Reshape_59/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_59/shapeo

Reshape_59Reshape
add_29:z:0Reshape_59/shape:output:0*
T0	*
_output_shapes
:2

Reshape_59f
Maximum_29/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_29/yt

Maximum_29MaximumReshape_59:output:0Maximum_29/y:output:0*
T0	*
_output_shapes
:2

Maximum_29o
ExpandDims_9/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_9/dim
ExpandDims_9
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_9/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_9f
GatherV2_18/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_18/axisΗ
GatherV2_18GatherV2ExpandDims_9:output:0DecodeProtoMap:indices:0GatherV2_18/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_18f
GatherV2_19/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_19/axisΝ
GatherV2_19GatherV2GatherV2_18:output:0DecodeProtoSparseV2_2:indices:0GatherV2_19/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_19e
Size_21SizeDecodeProtoMap:indices:7*
T0	*
_output_shapes
: *
out_type0	2	
Size_21n
Reshape_60/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_60/shapeu

Reshape_60ReshapeSize_21:output:0Reshape_60/shape:output:0*
T0	*
_output_shapes
:2

Reshape_60
RunLengthBefore_30RunLengthBeforeDecodeProtoSparseV2_9:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_30^
Const_30Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_30s
Max_30Max&RunLengthBefore_30:run_length_before:0Const_30:output:0*
T0	*
_output_shapes
: 2
Max_30V
add_30/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_30/y^
add_30AddV2Max_30:output:0add_30/y:output:0*
T0	*
_output_shapes
: 2
add_30n
Reshape_61/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_61/shapeo

Reshape_61Reshape
add_30:z:0Reshape_61/shape:output:0*
T0	*
_output_shapes
:2

Reshape_61f
Maximum_30/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_30/yt

Maximum_30MaximumReshape_61:output:0Maximum_30/y:output:0*
T0	*
_output_shapes
:2

Maximum_30j
Size_22SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_22n
Reshape_62/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_62/shapeu

Reshape_62ReshapeSize_22:output:0Reshape_62/shape:output:0*
T0	*
_output_shapes
:2

Reshape_62z
RunLengthBefore_31RunLengthBeforeDecodeProtoMap:indices:7*#
_output_shapes
:?????????2
RunLengthBefore_31^
Const_31Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_31s
Max_31Max&RunLengthBefore_31:run_length_before:0Const_31:output:0*
T0	*
_output_shapes
: 2
Max_31V
add_31/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_31/y^
add_31AddV2Max_31:output:0add_31/y:output:0*
T0	*
_output_shapes
: 2
add_31n
Reshape_63/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_63/shapeo

Reshape_63Reshape
add_31:z:0Reshape_63/shape:output:0*
T0	*
_output_shapes
:2

Reshape_63f
Maximum_31/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_31/yt

Maximum_31MaximumReshape_63:output:0Maximum_31/y:output:0*
T0	*
_output_shapes
:2

Maximum_31n
Reshape_64/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_64/shaper

Reshape_64ReshapeSize:output:0Reshape_64/shape:output:0*
T0	*
_output_shapes
:2

Reshape_64
RunLengthBefore_32RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_32^
Const_32Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_32s
Max_32Max&RunLengthBefore_32:run_length_before:0Const_32:output:0*
T0	*
_output_shapes
: 2
Max_32V
add_32/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_32/y^
add_32AddV2Max_32:output:0add_32/y:output:0*
T0	*
_output_shapes
: 2
add_32n
Reshape_65/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_65/shapeo

Reshape_65Reshape
add_32:z:0Reshape_65/shape:output:0*
T0	*
_output_shapes
:2

Reshape_65f
Maximum_32/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_32/yt

Maximum_32MaximumReshape_65:output:0Maximum_32/y:output:0*
T0	*
_output_shapes
:2

Maximum_32q
ExpandDims_10/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_10/dim
ExpandDims_10
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_10/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_10f
GatherV2_20/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_20/axisΘ
GatherV2_20GatherV2ExpandDims_10:output:0DecodeProtoMap:indices:7GatherV2_20/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_20f
GatherV2_21/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_21/axisΝ
GatherV2_21GatherV2GatherV2_20:output:0DecodeProtoSparseV2_9:indices:0GatherV2_21/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_21e
Size_23SizeDecodeProtoMap:indices:6*
T0	*
_output_shapes
: *
out_type0	2	
Size_23n
Reshape_66/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_66/shapeu

Reshape_66ReshapeSize_23:output:0Reshape_66/shape:output:0*
T0	*
_output_shapes
:2

Reshape_66
RunLengthBefore_33RunLengthBeforeDecodeProtoSparseV2_8:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_33^
Const_33Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_33s
Max_33Max&RunLengthBefore_33:run_length_before:0Const_33:output:0*
T0	*
_output_shapes
: 2
Max_33V
add_33/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_33/y^
add_33AddV2Max_33:output:0add_33/y:output:0*
T0	*
_output_shapes
: 2
add_33n
Reshape_67/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_67/shapeo

Reshape_67Reshape
add_33:z:0Reshape_67/shape:output:0*
T0	*
_output_shapes
:2

Reshape_67f
Maximum_33/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_33/yt

Maximum_33MaximumReshape_67:output:0Maximum_33/y:output:0*
T0	*
_output_shapes
:2

Maximum_33j
Size_24SizeDecodeProtoSparseV2:indices:0*
T0	*
_output_shapes
: *
out_type0	2	
Size_24n
Reshape_68/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_68/shapeu

Reshape_68ReshapeSize_24:output:0Reshape_68/shape:output:0*
T0	*
_output_shapes
:2

Reshape_68z
RunLengthBefore_34RunLengthBeforeDecodeProtoMap:indices:6*#
_output_shapes
:?????????2
RunLengthBefore_34^
Const_34Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_34s
Max_34Max&RunLengthBefore_34:run_length_before:0Const_34:output:0*
T0	*
_output_shapes
: 2
Max_34V
add_34/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_34/y^
add_34AddV2Max_34:output:0add_34/y:output:0*
T0	*
_output_shapes
: 2
add_34n
Reshape_69/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_69/shapeo

Reshape_69Reshape
add_34:z:0Reshape_69/shape:output:0*
T0	*
_output_shapes
:2

Reshape_69f
Maximum_34/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_34/yt

Maximum_34MaximumReshape_69:output:0Maximum_34/y:output:0*
T0	*
_output_shapes
:2

Maximum_34n
Reshape_70/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_70/shaper

Reshape_70ReshapeSize:output:0Reshape_70/shape:output:0*
T0	*
_output_shapes
:2

Reshape_70
RunLengthBefore_35RunLengthBeforeDecodeProtoSparseV2:indices:0*#
_output_shapes
:?????????2
RunLengthBefore_35^
Const_35Const*
_output_shapes
:*
dtype0*
valueB: 2

Const_35s
Max_35Max&RunLengthBefore_35:run_length_before:0Const_35:output:0*
T0	*
_output_shapes
: 2
Max_35V
add_35/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2

add_35/y^
add_35AddV2Max_35:output:0add_35/y:output:0*
T0	*
_output_shapes
: 2
add_35n
Reshape_71/shapeConst*
_output_shapes
:*
dtype0*
valueB:2
Reshape_71/shapeo

Reshape_71Reshape
add_35:z:0Reshape_71/shape:output:0*
T0	*
_output_shapes
:2

Reshape_71f
Maximum_35/yConst*
_output_shapes
:*
dtype0	*
valueB	R 2
Maximum_35/yt

Maximum_35MaximumReshape_71:output:0Maximum_35/y:output:0*
T0	*
_output_shapes
:2

Maximum_35q
ExpandDims_11/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
ExpandDims_11/dim
ExpandDims_11
ExpandDimsDecodeProtoSparseV2:indices:0ExpandDims_11/dim:output:0*
T0	*'
_output_shapes
:?????????2
ExpandDims_11f
GatherV2_22/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_22/axisΘ
GatherV2_22GatherV2ExpandDims_11:output:0DecodeProtoMap:indices:6GatherV2_22/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_22f
GatherV2_23/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
GatherV2_23/axisΝ
GatherV2_23GatherV2GatherV2_22:output:0DecodeProtoSparseV2_8:indices:0GatherV2_23/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????2
GatherV2_23a
Cast/xConst*
_output_shapes
:*
dtype0*
valueB"????   2
Cast/xY
CastCastCast/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast
SparseReshapeSparseReshapeGatherV2_1:output:0Reshape_4:output:0Cast:y:0*-
_output_shapes
:?????????:2
SparseReshape
SparseReshape/IdentityIdentityDecodeProtoSparseV2_6:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape/Identitye
Cast_1/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_1/x_
Cast_1CastCast_1/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_1
SparseReshape_1SparseReshapeGatherV2_3:output:0Reshape_10:output:0
Cast_1:y:0*-
_output_shapes
:?????????:2
SparseReshape_1
SparseReshape_1/IdentityIdentityDecodeProtoSparseV2_3:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_1/Identitye
Cast_2/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_2/x_
Cast_2CastCast_2/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_2
SparseReshape_2SparseReshapeGatherV2_5:output:0Reshape_16:output:0
Cast_2:y:0*-
_output_shapes
:?????????:2
SparseReshape_2
SparseReshape_2/IdentityIdentityDecodeProtoSparseV2_7:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_2/Identitye
Cast_3/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_3/x_
Cast_3CastCast_3/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_3
SparseReshape_3SparseReshapeGatherV2_7:output:0Reshape_22:output:0
Cast_3:y:0*-
_output_shapes
:?????????:2
SparseReshape_3
SparseReshape_3/IdentityIdentityDecodeProtoSparseV2_11:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_3/Identitye
Cast_4/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_4/x_
Cast_4CastCast_4/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_4
SparseReshape_4SparseReshapeGatherV2_9:output:0Reshape_28:output:0
Cast_4:y:0*-
_output_shapes
:?????????:2
SparseReshape_4
SparseReshape_4/IdentityIdentityDecodeProtoSparseV2_5:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_4/Identitye
Cast_5/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_5/x_
Cast_5CastCast_5/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_5
SparseReshape_5SparseReshapeGatherV2_11:output:0Reshape_34:output:0
Cast_5:y:0*-
_output_shapes
:?????????:2
SparseReshape_5
SparseReshape_5/IdentityIdentityDecodeProtoSparseV2_13:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_5/Identitye
Cast_6/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_6/x_
Cast_6CastCast_6/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_6
SparseReshape_6SparseReshapeGatherV2_13:output:0Reshape_40:output:0
Cast_6:y:0*-
_output_shapes
:?????????:2
SparseReshape_6
SparseReshape_6/IdentityIdentityDecodeProtoSparseV2_10:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_6/Identitye
Cast_7/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_7/x_
Cast_7CastCast_7/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_7
SparseReshape_7SparseReshapeGatherV2_15:output:0Reshape_46:output:0
Cast_7:y:0*-
_output_shapes
:?????????:2
SparseReshape_7
SparseReshape_7/IdentityIdentityDecodeProtoSparseV2_12:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_7/Identitye
Cast_8/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_8/x_
Cast_8CastCast_8/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_8
SparseReshape_8SparseReshapeGatherV2_17:output:0Reshape_52:output:0
Cast_8:y:0*-
_output_shapes
:?????????:2
SparseReshape_8
SparseReshape_8/IdentityIdentityDecodeProtoSparseV2_4:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_8/Identitye
Cast_9/xConst*
_output_shapes
:*
dtype0*
valueB"????   2

Cast_9/x_
Cast_9CastCast_9/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2
Cast_9
SparseReshape_9SparseReshapeGatherV2_19:output:0Reshape_58:output:0
Cast_9:y:0*-
_output_shapes
:?????????:2
SparseReshape_9
SparseReshape_9/IdentityIdentityDecodeProtoSparseV2_2:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_9/Identityg
	Cast_10/xConst*
_output_shapes
:*
dtype0*
valueB"????   2
	Cast_10/xb
Cast_10CastCast_10/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2	
Cast_10
SparseReshape_10SparseReshapeGatherV2_21:output:0Reshape_64:output:0Cast_10:y:0*-
_output_shapes
:?????????:2
SparseReshape_10
SparseReshape_10/IdentityIdentityDecodeProtoSparseV2_9:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_10/Identityg
	Cast_11/xConst*
_output_shapes
:*
dtype0*
valueB"????   2
	Cast_11/xb
Cast_11CastCast_11/x:output:0*

DstT0	*

SrcT0*
_output_shapes
:2	
Cast_11
SparseReshape_11SparseReshapeGatherV2_23:output:0Reshape_70:output:0Cast_11:y:0*-
_output_shapes
:?????????:2
SparseReshape_11
SparseReshape_11/IdentityIdentityDecodeProtoSparseV2_8:values:0*
T0*#
_output_shapes
:?????????2
SparseReshape_11/Identityr
IdentityIdentitySparseReshape:output_indices:0*
T0	*'
_output_shapes
:?????????2

Identitys

Identity_1IdentitySparseReshape/Identity:output:0*
T0*#
_output_shapes
:?????????2

Identity_1g

Identity_2IdentitySparseReshape:output_shape:0*
T0	*
_output_shapes
:2

Identity_2x

Identity_3Identity SparseReshape_1:output_indices:0*
T0	*'
_output_shapes
:?????????2

Identity_3u

Identity_4Identity!SparseReshape_1/Identity:output:0*
T0*#
_output_shapes
:?????????2

Identity_4i

Identity_5IdentitySparseReshape_1:output_shape:0*
T0	*
_output_shapes
:2

Identity_5x

Identity_6Identity SparseReshape_2:output_indices:0*
T0	*'
_output_shapes
:?????????2

Identity_6u

Identity_7Identity!SparseReshape_2/Identity:output:0*
T0*#
_output_shapes
:?????????2

Identity_7i

Identity_8IdentitySparseReshape_2:output_shape:0*
T0	*
_output_shapes
:2

Identity_8x

Identity_9Identity SparseReshape_3:output_indices:0*
T0	*'
_output_shapes
:?????????2

Identity_9w
Identity_10Identity!SparseReshape_3/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_10k
Identity_11IdentitySparseReshape_3:output_shape:0*
T0	*
_output_shapes
:2
Identity_11z
Identity_12Identity SparseReshape_4:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_12w
Identity_13Identity!SparseReshape_4/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_13k
Identity_14IdentitySparseReshape_4:output_shape:0*
T0	*
_output_shapes
:2
Identity_14z
Identity_15Identity SparseReshape_5:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_15w
Identity_16Identity!SparseReshape_5/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_16k
Identity_17IdentitySparseReshape_5:output_shape:0*
T0	*
_output_shapes
:2
Identity_17z
Identity_18Identity SparseReshape_6:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_18w
Identity_19Identity!SparseReshape_6/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_19k
Identity_20IdentitySparseReshape_6:output_shape:0*
T0	*
_output_shapes
:2
Identity_20z
Identity_21Identity SparseReshape_7:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_21w
Identity_22Identity!SparseReshape_7/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_22k
Identity_23IdentitySparseReshape_7:output_shape:0*
T0	*
_output_shapes
:2
Identity_23z
Identity_24Identity SparseReshape_8:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_24w
Identity_25Identity!SparseReshape_8/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_25k
Identity_26IdentitySparseReshape_8:output_shape:0*
T0	*
_output_shapes
:2
Identity_26z
Identity_27Identity SparseReshape_9:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_27w
Identity_28Identity!SparseReshape_9/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_28k
Identity_29IdentitySparseReshape_9:output_shape:0*
T0	*
_output_shapes
:2
Identity_29{
Identity_30Identity!SparseReshape_10:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_30x
Identity_31Identity"SparseReshape_10/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_31l
Identity_32IdentitySparseReshape_10:output_shape:0*
T0	*
_output_shapes
:2
Identity_32{
Identity_33Identity!SparseReshape_11:output_indices:0*
T0	*'
_output_shapes
:?????????2
Identity_33x
Identity_34Identity"SparseReshape_11/Identity:output:0*
T0*#
_output_shapes
:?????????2
Identity_34l
Identity_35IdentitySparseReshape_11:output_shape:0*
T0	*
_output_shapes
:2
Identity_35"
identityIdentity:output:0"!

identity_1Identity_1:output:0"#
identity_10Identity_10:output:0"#
identity_11Identity_11:output:0"#
identity_12Identity_12:output:0"#
identity_13Identity_13:output:0"#
identity_14Identity_14:output:0"#
identity_15Identity_15:output:0"#
identity_16Identity_16:output:0"#
identity_17Identity_17:output:0"#
identity_18Identity_18:output:0"#
identity_19Identity_19:output:0"!

identity_2Identity_2:output:0"#
identity_20Identity_20:output:0"#
identity_21Identity_21:output:0"#
identity_22Identity_22:output:0"#
identity_23Identity_23:output:0"#
identity_24Identity_24:output:0"#
identity_25Identity_25:output:0"#
identity_26Identity_26:output:0"#
identity_27Identity_27:output:0"#
identity_28Identity_28:output:0"#
identity_29Identity_29:output:0"!

identity_3Identity_3:output:0"#
identity_30Identity_30:output:0"#
identity_31Identity_31:output:0"#
identity_32Identity_32:output:0"#
identity_33Identity_33:output:0"#
identity_34Identity_34:output:0"#
identity_35Identity_35:output:0"!

identity_4Identity_4:output:0"!

identity_5Identity_5:output:0"!

identity_6Identity_6:output:0"!

identity_7Identity_7:output:0"!

identity_8Identity_8:output:0"!

identity_9Identity_9:output:0*"
_input_shapes
:?????????:K G
#
_output_shapes
:?????????
 
_user_specified_namerecord

ά
cond_false_10031O
Ksparsereducesum_transform_transform_sparsefillemptyrows_sparsefillemptyrows	W
Ssparsereducesum_transform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2	J
Fsparsereducesum_transform_transform_inputs_inputs_preset_preset_2_copy	
dense_to_sparse_where	
dense_to_sparse_gathernd	
dense_to_sparse_shape	
SparseReduceSum/reduction_axesConst*
_output_shapes
: *
dtype0*
value	B :2 
SparseReduceSum/reduction_axesλ
SparseReduceSumSparseReduceSumKsparsereducesum_transform_transform_sparsefillemptyrows_sparsefillemptyrowsSsparsereducesum_transform_transform_apply_vocab_hash_table_lookup_lookuptablefindv2Fsparsereducesum_transform_transform_inputs_inputs_preset_preset_2_copy'SparseReduceSum/reduction_axes:output:0*
T0	*
_output_shapes
:2
SparseReduceSumo
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"????   2
Reshape/shape
ReshapeReshapeSparseReduceSum:output:0Reshape/shape:output:0*
T0	*'
_output_shapes
:?????????2	
Reshape
dense_to_sparse/zeros_like	ZerosLikeReshape:output:0*
T0	*'
_output_shapes
:?????????2
dense_to_sparse/zeros_like€
dense_to_sparse/NotEqualNotEqualReshape:output:0dense_to_sparse/zeros_like:y:0*
T0	*'
_output_shapes
:?????????2
dense_to_sparse/NotEqual~
dense_to_sparse/WhereWheredense_to_sparse/NotEqual:z:0*'
_output_shapes
:?????????2
dense_to_sparse/Where΅
dense_to_sparse/GatherNdGatherNdReshape:output:0dense_to_sparse/Where:index:0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????2
dense_to_sparse/GatherNd~
dense_to_sparse/ShapeShapeReshape:output:0*
T0	*
_output_shapes
:*
out_type0	2
dense_to_sparse/Shape"=
dense_to_sparse_gathernd!dense_to_sparse/GatherNd:output:0"7
dense_to_sparse_shapedense_to_sparse/Shape:output:0"6
dense_to_sparse_wheredense_to_sparse/Where:index:0*;
_input_shapes*
(:?????????:?????????::- )
'
_output_shapes
:?????????:)%
#
_output_shapes
:?????????: 

_output_shapes
:
θ


cond_1_true_10061
shape_cast_cond_identity_2	
cond_identity_0	
cond_identity_1_0	
cond_identity	
cond_identity_1		
stack	p

Shape/CastCastshape_cast_cond_identity_2*

DstT0*

SrcT0	*
_output_shapes
:2

Shape/Castt
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2β
strided_sliceStridedSliceShape/Cast:y:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_slice\
CastCaststrided_slice:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2
CastP
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R2
ConstD
stack_0PackCast:y:0Const:output:0*
N*
T0	2
stack" 
cond_identitycond_identity_0"$
cond_identity_1cond_identity_1_0"
stackstack_0:output:0*;
_input_shapes*
(::?????????:?????????:  

_output_shapes
::-)
'
_output_shapes
:?????????:)%
#
_output_shapes
:?????????
Ύ

cond_1_false_10062
cond_identity_2_0	
cond_identity_0	
cond_identity_1_0	
cond_identity	
cond_identity_1	
cond_identity_2	" 
cond_identitycond_identity_0"$
cond_identity_1cond_identity_1_0"$
cond_identity_2cond_identity_2_0*;
_input_shapes*
(::?????????:?????????:  

_output_shapes
::-)
'
_output_shapes
:?????????:)%
#
_output_shapes
:?????????"±B
save_5/Const:0save_5/Identity:0save_5/restore_all (5 @F8" 
asset_filepaths

	Const_1:0"~
global_stepom
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H"Ό
model_variables¨₯

7trial1/input_layer/preset_embedding/embedding_weights:0<trial1/input_layer/preset_embedding/embedding_weights/AssignKtrial1/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

7trial2/input_layer/preset_embedding/embedding_weights:0<trial2/input_layer/preset_embedding/embedding_weights/AssignKtrial2/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

7trial3/input_layer/preset_embedding/embedding_weights:0<trial3/input_layer/preset_embedding/embedding_weights/AssignKtrial3/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

7trial4/input_layer/preset_embedding/embedding_weights:0<trial4/input_layer/preset_embedding/embedding_weights/AssignKtrial4/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

7trial5/input_layer/preset_embedding/embedding_weights:0<trial5/input_layer/preset_embedding/embedding_weights/AssignKtrial5/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08"φ
saveable_objectsα
ή
trial16/boosted_trees:0
+trial16/boosted_trees/QuantileAccumulator:0
trial17/boosted_trees:0
+trial17/boosted_trees/QuantileAccumulator:0
trial18/boosted_trees:0
+trial18/boosted_trees/QuantileAccumulator:0
trial19/boosted_trees:0
+trial19/boosted_trees/QuantileAccumulator:0
trial20/boosted_trees:0
+trial20/boosted_trees/QuantileAccumulator:0"d
saved_model_assetsN*L
J
+type.googleapis.com/tensorflow.AssetFileDef

	Const_1:0preset_vocab"'
saved_model_main_op

group_deps_5"e
table_initializerP
N
Ltransform/transform/apply_vocab/text_file_init/InitializeTableFromTextFileV2"H
tft_schema_override_max-
+
)transform/transform/apply_vocab/Maximum:0"H
tft_schema_override_min-
+
)transform/transform/apply_vocab/Minimum:0"g
tft_schema_override_tensorI
G
Etransform/transform/apply_vocab/hash_table_Lookup/LookupTableFindV2:0"ΥE
trainable_variables½EΊE

7trial1/input_layer/preset_embedding/embedding_weights:0<trial1/input_layer/preset_embedding/embedding_weights/AssignKtrial1/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial1/dense/kernel:0trial1/dense/kernel/Assign)trial1/dense/kernel/Read/ReadVariableOp:0(20trial1/dense/kernel/Initializer/random_uniform:08

trial1/dense/bias:0trial1/dense/bias/Assign'trial1/dense/bias/Read/ReadVariableOp:0(2%trial1/dense/bias/Initializer/zeros:08

trial1/dense_1/kernel:0trial1/dense_1/kernel/Assign+trial1/dense_1/kernel/Read/ReadVariableOp:0(22trial1/dense_1/kernel/Initializer/random_uniform:08

trial1/dense_1/bias:0trial1/dense_1/bias/Assign)trial1/dense_1/bias/Read/ReadVariableOp:0(2'trial1/dense_1/bias/Initializer/zeros:08

trial1/dense_2/kernel:0trial1/dense_2/kernel/Assign+trial1/dense_2/kernel/Read/ReadVariableOp:0(22trial1/dense_2/kernel/Initializer/random_uniform:08

trial1/dense_2/bias:0trial1/dense_2/bias/Assign)trial1/dense_2/bias/Read/ReadVariableOp:0(2'trial1/dense_2/bias/Initializer/zeros:08

trial1/dense_3/kernel:0trial1/dense_3/kernel/Assign+trial1/dense_3/kernel/Read/ReadVariableOp:0(22trial1/dense_3/kernel/Initializer/random_uniform:08

trial1/dense_3/bias:0trial1/dense_3/bias/Assign)trial1/dense_3/bias/Read/ReadVariableOp:0(2'trial1/dense_3/bias/Initializer/zeros:08

trial1/dense_4/kernel:0trial1/dense_4/kernel/Assign+trial1/dense_4/kernel/Read/ReadVariableOp:0(22trial1/dense_4/kernel/Initializer/random_uniform:08

trial1/dense_4/bias:0trial1/dense_4/bias/Assign)trial1/dense_4/bias/Read/ReadVariableOp:0(2'trial1/dense_4/bias/Initializer/zeros:08

7trial2/input_layer/preset_embedding/embedding_weights:0<trial2/input_layer/preset_embedding/embedding_weights/AssignKtrial2/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial2/dense/kernel:0trial2/dense/kernel/Assign)trial2/dense/kernel/Read/ReadVariableOp:0(20trial2/dense/kernel/Initializer/random_uniform:08

trial2/dense/bias:0trial2/dense/bias/Assign'trial2/dense/bias/Read/ReadVariableOp:0(2%trial2/dense/bias/Initializer/zeros:08

trial2/dense_1/kernel:0trial2/dense_1/kernel/Assign+trial2/dense_1/kernel/Read/ReadVariableOp:0(22trial2/dense_1/kernel/Initializer/random_uniform:08

trial2/dense_1/bias:0trial2/dense_1/bias/Assign)trial2/dense_1/bias/Read/ReadVariableOp:0(2'trial2/dense_1/bias/Initializer/zeros:08

trial2/dense_2/kernel:0trial2/dense_2/kernel/Assign+trial2/dense_2/kernel/Read/ReadVariableOp:0(22trial2/dense_2/kernel/Initializer/random_uniform:08

trial2/dense_2/bias:0trial2/dense_2/bias/Assign)trial2/dense_2/bias/Read/ReadVariableOp:0(2'trial2/dense_2/bias/Initializer/zeros:08

trial2/dense_3/kernel:0trial2/dense_3/kernel/Assign+trial2/dense_3/kernel/Read/ReadVariableOp:0(22trial2/dense_3/kernel/Initializer/random_uniform:08

trial2/dense_3/bias:0trial2/dense_3/bias/Assign)trial2/dense_3/bias/Read/ReadVariableOp:0(2'trial2/dense_3/bias/Initializer/zeros:08

trial2/dense_4/kernel:0trial2/dense_4/kernel/Assign+trial2/dense_4/kernel/Read/ReadVariableOp:0(22trial2/dense_4/kernel/Initializer/random_uniform:08

trial2/dense_4/bias:0trial2/dense_4/bias/Assign)trial2/dense_4/bias/Read/ReadVariableOp:0(2'trial2/dense_4/bias/Initializer/zeros:08

7trial3/input_layer/preset_embedding/embedding_weights:0<trial3/input_layer/preset_embedding/embedding_weights/AssignKtrial3/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial3/dense/kernel:0trial3/dense/kernel/Assign)trial3/dense/kernel/Read/ReadVariableOp:0(20trial3/dense/kernel/Initializer/random_uniform:08

trial3/dense/bias:0trial3/dense/bias/Assign'trial3/dense/bias/Read/ReadVariableOp:0(2%trial3/dense/bias/Initializer/zeros:08

trial3/dense_1/kernel:0trial3/dense_1/kernel/Assign+trial3/dense_1/kernel/Read/ReadVariableOp:0(22trial3/dense_1/kernel/Initializer/random_uniform:08

trial3/dense_1/bias:0trial3/dense_1/bias/Assign)trial3/dense_1/bias/Read/ReadVariableOp:0(2'trial3/dense_1/bias/Initializer/zeros:08

trial3/dense_2/kernel:0trial3/dense_2/kernel/Assign+trial3/dense_2/kernel/Read/ReadVariableOp:0(22trial3/dense_2/kernel/Initializer/random_uniform:08

trial3/dense_2/bias:0trial3/dense_2/bias/Assign)trial3/dense_2/bias/Read/ReadVariableOp:0(2'trial3/dense_2/bias/Initializer/zeros:08

trial3/dense_3/kernel:0trial3/dense_3/kernel/Assign+trial3/dense_3/kernel/Read/ReadVariableOp:0(22trial3/dense_3/kernel/Initializer/random_uniform:08

trial3/dense_3/bias:0trial3/dense_3/bias/Assign)trial3/dense_3/bias/Read/ReadVariableOp:0(2'trial3/dense_3/bias/Initializer/zeros:08

trial3/dense_4/kernel:0trial3/dense_4/kernel/Assign+trial3/dense_4/kernel/Read/ReadVariableOp:0(22trial3/dense_4/kernel/Initializer/random_uniform:08

trial3/dense_4/bias:0trial3/dense_4/bias/Assign)trial3/dense_4/bias/Read/ReadVariableOp:0(2'trial3/dense_4/bias/Initializer/zeros:08

7trial4/input_layer/preset_embedding/embedding_weights:0<trial4/input_layer/preset_embedding/embedding_weights/AssignKtrial4/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial4/dense/kernel:0trial4/dense/kernel/Assign)trial4/dense/kernel/Read/ReadVariableOp:0(20trial4/dense/kernel/Initializer/random_uniform:08

trial4/dense/bias:0trial4/dense/bias/Assign'trial4/dense/bias/Read/ReadVariableOp:0(2%trial4/dense/bias/Initializer/zeros:08

trial4/dense_1/kernel:0trial4/dense_1/kernel/Assign+trial4/dense_1/kernel/Read/ReadVariableOp:0(22trial4/dense_1/kernel/Initializer/random_uniform:08

trial4/dense_1/bias:0trial4/dense_1/bias/Assign)trial4/dense_1/bias/Read/ReadVariableOp:0(2'trial4/dense_1/bias/Initializer/zeros:08

trial4/dense_2/kernel:0trial4/dense_2/kernel/Assign+trial4/dense_2/kernel/Read/ReadVariableOp:0(22trial4/dense_2/kernel/Initializer/random_uniform:08

trial4/dense_2/bias:0trial4/dense_2/bias/Assign)trial4/dense_2/bias/Read/ReadVariableOp:0(2'trial4/dense_2/bias/Initializer/zeros:08

trial4/dense_3/kernel:0trial4/dense_3/kernel/Assign+trial4/dense_3/kernel/Read/ReadVariableOp:0(22trial4/dense_3/kernel/Initializer/random_uniform:08

trial4/dense_3/bias:0trial4/dense_3/bias/Assign)trial4/dense_3/bias/Read/ReadVariableOp:0(2'trial4/dense_3/bias/Initializer/zeros:08

trial4/dense_4/kernel:0trial4/dense_4/kernel/Assign+trial4/dense_4/kernel/Read/ReadVariableOp:0(22trial4/dense_4/kernel/Initializer/random_uniform:08

trial4/dense_4/bias:0trial4/dense_4/bias/Assign)trial4/dense_4/bias/Read/ReadVariableOp:0(2'trial4/dense_4/bias/Initializer/zeros:08

7trial5/input_layer/preset_embedding/embedding_weights:0<trial5/input_layer/preset_embedding/embedding_weights/AssignKtrial5/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial5/dense/kernel:0trial5/dense/kernel/Assign)trial5/dense/kernel/Read/ReadVariableOp:0(20trial5/dense/kernel/Initializer/random_uniform:08

trial5/dense/bias:0trial5/dense/bias/Assign'trial5/dense/bias/Read/ReadVariableOp:0(2%trial5/dense/bias/Initializer/zeros:08

trial5/dense_1/kernel:0trial5/dense_1/kernel/Assign+trial5/dense_1/kernel/Read/ReadVariableOp:0(22trial5/dense_1/kernel/Initializer/random_uniform:08

trial5/dense_1/bias:0trial5/dense_1/bias/Assign)trial5/dense_1/bias/Read/ReadVariableOp:0(2'trial5/dense_1/bias/Initializer/zeros:08

trial5/dense_2/kernel:0trial5/dense_2/kernel/Assign+trial5/dense_2/kernel/Read/ReadVariableOp:0(22trial5/dense_2/kernel/Initializer/random_uniform:08

trial5/dense_2/bias:0trial5/dense_2/bias/Assign)trial5/dense_2/bias/Read/ReadVariableOp:0(2'trial5/dense_2/bias/Initializer/zeros:08

trial5/dense_3/kernel:0trial5/dense_3/kernel/Assign+trial5/dense_3/kernel/Read/ReadVariableOp:0(22trial5/dense_3/kernel/Initializer/random_uniform:08

trial5/dense_3/bias:0trial5/dense_3/bias/Assign)trial5/dense_3/bias/Read/ReadVariableOp:0(2'trial5/dense_3/bias/Initializer/zeros:08

trial5/dense_4/kernel:0trial5/dense_4/kernel/Assign+trial5/dense_4/kernel/Read/ReadVariableOp:0(22trial5/dense_4/kernel/Initializer/random_uniform:08

trial5/dense_4/bias:0trial5/dense_4/bias/Assign)trial5/dense_4/bias/Read/ReadVariableOp:0(2'trial5/dense_4/bias/Initializer/zeros:08"ΈF
	variablesͺF§F
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H

7trial1/input_layer/preset_embedding/embedding_weights:0<trial1/input_layer/preset_embedding/embedding_weights/AssignKtrial1/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial1/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial1/dense/kernel:0trial1/dense/kernel/Assign)trial1/dense/kernel/Read/ReadVariableOp:0(20trial1/dense/kernel/Initializer/random_uniform:08

trial1/dense/bias:0trial1/dense/bias/Assign'trial1/dense/bias/Read/ReadVariableOp:0(2%trial1/dense/bias/Initializer/zeros:08

trial1/dense_1/kernel:0trial1/dense_1/kernel/Assign+trial1/dense_1/kernel/Read/ReadVariableOp:0(22trial1/dense_1/kernel/Initializer/random_uniform:08

trial1/dense_1/bias:0trial1/dense_1/bias/Assign)trial1/dense_1/bias/Read/ReadVariableOp:0(2'trial1/dense_1/bias/Initializer/zeros:08

trial1/dense_2/kernel:0trial1/dense_2/kernel/Assign+trial1/dense_2/kernel/Read/ReadVariableOp:0(22trial1/dense_2/kernel/Initializer/random_uniform:08

trial1/dense_2/bias:0trial1/dense_2/bias/Assign)trial1/dense_2/bias/Read/ReadVariableOp:0(2'trial1/dense_2/bias/Initializer/zeros:08

trial1/dense_3/kernel:0trial1/dense_3/kernel/Assign+trial1/dense_3/kernel/Read/ReadVariableOp:0(22trial1/dense_3/kernel/Initializer/random_uniform:08

trial1/dense_3/bias:0trial1/dense_3/bias/Assign)trial1/dense_3/bias/Read/ReadVariableOp:0(2'trial1/dense_3/bias/Initializer/zeros:08

trial1/dense_4/kernel:0trial1/dense_4/kernel/Assign+trial1/dense_4/kernel/Read/ReadVariableOp:0(22trial1/dense_4/kernel/Initializer/random_uniform:08

trial1/dense_4/bias:0trial1/dense_4/bias/Assign)trial1/dense_4/bias/Read/ReadVariableOp:0(2'trial1/dense_4/bias/Initializer/zeros:08

7trial2/input_layer/preset_embedding/embedding_weights:0<trial2/input_layer/preset_embedding/embedding_weights/AssignKtrial2/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial2/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial2/dense/kernel:0trial2/dense/kernel/Assign)trial2/dense/kernel/Read/ReadVariableOp:0(20trial2/dense/kernel/Initializer/random_uniform:08

trial2/dense/bias:0trial2/dense/bias/Assign'trial2/dense/bias/Read/ReadVariableOp:0(2%trial2/dense/bias/Initializer/zeros:08

trial2/dense_1/kernel:0trial2/dense_1/kernel/Assign+trial2/dense_1/kernel/Read/ReadVariableOp:0(22trial2/dense_1/kernel/Initializer/random_uniform:08

trial2/dense_1/bias:0trial2/dense_1/bias/Assign)trial2/dense_1/bias/Read/ReadVariableOp:0(2'trial2/dense_1/bias/Initializer/zeros:08

trial2/dense_2/kernel:0trial2/dense_2/kernel/Assign+trial2/dense_2/kernel/Read/ReadVariableOp:0(22trial2/dense_2/kernel/Initializer/random_uniform:08

trial2/dense_2/bias:0trial2/dense_2/bias/Assign)trial2/dense_2/bias/Read/ReadVariableOp:0(2'trial2/dense_2/bias/Initializer/zeros:08

trial2/dense_3/kernel:0trial2/dense_3/kernel/Assign+trial2/dense_3/kernel/Read/ReadVariableOp:0(22trial2/dense_3/kernel/Initializer/random_uniform:08

trial2/dense_3/bias:0trial2/dense_3/bias/Assign)trial2/dense_3/bias/Read/ReadVariableOp:0(2'trial2/dense_3/bias/Initializer/zeros:08

trial2/dense_4/kernel:0trial2/dense_4/kernel/Assign+trial2/dense_4/kernel/Read/ReadVariableOp:0(22trial2/dense_4/kernel/Initializer/random_uniform:08

trial2/dense_4/bias:0trial2/dense_4/bias/Assign)trial2/dense_4/bias/Read/ReadVariableOp:0(2'trial2/dense_4/bias/Initializer/zeros:08

7trial3/input_layer/preset_embedding/embedding_weights:0<trial3/input_layer/preset_embedding/embedding_weights/AssignKtrial3/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial3/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial3/dense/kernel:0trial3/dense/kernel/Assign)trial3/dense/kernel/Read/ReadVariableOp:0(20trial3/dense/kernel/Initializer/random_uniform:08

trial3/dense/bias:0trial3/dense/bias/Assign'trial3/dense/bias/Read/ReadVariableOp:0(2%trial3/dense/bias/Initializer/zeros:08

trial3/dense_1/kernel:0trial3/dense_1/kernel/Assign+trial3/dense_1/kernel/Read/ReadVariableOp:0(22trial3/dense_1/kernel/Initializer/random_uniform:08

trial3/dense_1/bias:0trial3/dense_1/bias/Assign)trial3/dense_1/bias/Read/ReadVariableOp:0(2'trial3/dense_1/bias/Initializer/zeros:08

trial3/dense_2/kernel:0trial3/dense_2/kernel/Assign+trial3/dense_2/kernel/Read/ReadVariableOp:0(22trial3/dense_2/kernel/Initializer/random_uniform:08

trial3/dense_2/bias:0trial3/dense_2/bias/Assign)trial3/dense_2/bias/Read/ReadVariableOp:0(2'trial3/dense_2/bias/Initializer/zeros:08

trial3/dense_3/kernel:0trial3/dense_3/kernel/Assign+trial3/dense_3/kernel/Read/ReadVariableOp:0(22trial3/dense_3/kernel/Initializer/random_uniform:08

trial3/dense_3/bias:0trial3/dense_3/bias/Assign)trial3/dense_3/bias/Read/ReadVariableOp:0(2'trial3/dense_3/bias/Initializer/zeros:08

trial3/dense_4/kernel:0trial3/dense_4/kernel/Assign+trial3/dense_4/kernel/Read/ReadVariableOp:0(22trial3/dense_4/kernel/Initializer/random_uniform:08

trial3/dense_4/bias:0trial3/dense_4/bias/Assign)trial3/dense_4/bias/Read/ReadVariableOp:0(2'trial3/dense_4/bias/Initializer/zeros:08

7trial4/input_layer/preset_embedding/embedding_weights:0<trial4/input_layer/preset_embedding/embedding_weights/AssignKtrial4/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial4/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial4/dense/kernel:0trial4/dense/kernel/Assign)trial4/dense/kernel/Read/ReadVariableOp:0(20trial4/dense/kernel/Initializer/random_uniform:08

trial4/dense/bias:0trial4/dense/bias/Assign'trial4/dense/bias/Read/ReadVariableOp:0(2%trial4/dense/bias/Initializer/zeros:08

trial4/dense_1/kernel:0trial4/dense_1/kernel/Assign+trial4/dense_1/kernel/Read/ReadVariableOp:0(22trial4/dense_1/kernel/Initializer/random_uniform:08

trial4/dense_1/bias:0trial4/dense_1/bias/Assign)trial4/dense_1/bias/Read/ReadVariableOp:0(2'trial4/dense_1/bias/Initializer/zeros:08

trial4/dense_2/kernel:0trial4/dense_2/kernel/Assign+trial4/dense_2/kernel/Read/ReadVariableOp:0(22trial4/dense_2/kernel/Initializer/random_uniform:08

trial4/dense_2/bias:0trial4/dense_2/bias/Assign)trial4/dense_2/bias/Read/ReadVariableOp:0(2'trial4/dense_2/bias/Initializer/zeros:08

trial4/dense_3/kernel:0trial4/dense_3/kernel/Assign+trial4/dense_3/kernel/Read/ReadVariableOp:0(22trial4/dense_3/kernel/Initializer/random_uniform:08

trial4/dense_3/bias:0trial4/dense_3/bias/Assign)trial4/dense_3/bias/Read/ReadVariableOp:0(2'trial4/dense_3/bias/Initializer/zeros:08

trial4/dense_4/kernel:0trial4/dense_4/kernel/Assign+trial4/dense_4/kernel/Read/ReadVariableOp:0(22trial4/dense_4/kernel/Initializer/random_uniform:08

trial4/dense_4/bias:0trial4/dense_4/bias/Assign)trial4/dense_4/bias/Read/ReadVariableOp:0(2'trial4/dense_4/bias/Initializer/zeros:08

7trial5/input_layer/preset_embedding/embedding_weights:0<trial5/input_layer/preset_embedding/embedding_weights/AssignKtrial5/input_layer/preset_embedding/embedding_weights/Read/ReadVariableOp:0(2Ttrial5/input_layer/preset_embedding/embedding_weights/Initializer/truncated_normal:08

trial5/dense/kernel:0trial5/dense/kernel/Assign)trial5/dense/kernel/Read/ReadVariableOp:0(20trial5/dense/kernel/Initializer/random_uniform:08

trial5/dense/bias:0trial5/dense/bias/Assign'trial5/dense/bias/Read/ReadVariableOp:0(2%trial5/dense/bias/Initializer/zeros:08

trial5/dense_1/kernel:0trial5/dense_1/kernel/Assign+trial5/dense_1/kernel/Read/ReadVariableOp:0(22trial5/dense_1/kernel/Initializer/random_uniform:08

trial5/dense_1/bias:0trial5/dense_1/bias/Assign)trial5/dense_1/bias/Read/ReadVariableOp:0(2'trial5/dense_1/bias/Initializer/zeros:08

trial5/dense_2/kernel:0trial5/dense_2/kernel/Assign+trial5/dense_2/kernel/Read/ReadVariableOp:0(22trial5/dense_2/kernel/Initializer/random_uniform:08

trial5/dense_2/bias:0trial5/dense_2/bias/Assign)trial5/dense_2/bias/Read/ReadVariableOp:0(2'trial5/dense_2/bias/Initializer/zeros:08

trial5/dense_3/kernel:0trial5/dense_3/kernel/Assign+trial5/dense_3/kernel/Read/ReadVariableOp:0(22trial5/dense_3/kernel/Initializer/random_uniform:08

trial5/dense_3/bias:0trial5/dense_3/bias/Assign)trial5/dense_3/bias/Read/ReadVariableOp:0(2'trial5/dense_3/bias/Initializer/zeros:08

trial5/dense_4/kernel:0trial5/dense_4/kernel/Assign+trial5/dense_4/kernel/Read/ReadVariableOp:0(22trial5/dense_4/kernel/Initializer/random_uniform:08

trial5/dense_4/bias:0trial5/dense_4/bias/Assign)trial5/dense_4/bias/Read/ReadVariableOp:0(2'trial5/dense_4/bias/Initializer/zeros:08*
serving_defaultu
*
inputs 
Placeholder:0?????????+
outputs 
	truediv:0?????????tensorflow/serving/regress