Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACEF6E002F9
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:33:35 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id w15so4167914iea.5
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3rLo10apveOkkdtO6Sg9BNbVZvLm6e3OVy2ZHkej/dk=;
	b=vn0zZ8D8kzQLkQSZo8uemQ5uQYb6TwWUfjch56yu/szN2Z7KMQ2xEWIbdAyI1/d8BE
	YxjZhVcY/M3NrH7Pr35p/s5PaktX3qwuNhYazwT+cR65aSTSEjXs9I87+95uxxv/I5od
	GHE+beYu8X7GzjcMSQ9NOt2SJccuiFTCijjr5vIASFQeuRYZ3GgrbHthTIDSZSnNc9Dz
	9cecdjo7TgGJwx5j5h+o70U04OCo25xzW+44dtVW/LYBf3/i25mqgcqEX+n2f+YVmLWo
	LiHwO4ezafIm5HvQMtriA6bRN/cUIxO/zQwipVPg7sBCWL0MvVcafyzHCi9rTy5wSUgd
	5I/Q==
X-Received: by 10.50.77.80 with SMTP id q16mr679958igw.3.1376688814560; Fri,
	16 Aug 2013 14:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 16 Aug 2013 14:33:03 -0700 (PDT)
In-Reply-To: <CAFZh4h8sm+V_QrvsdxiTmZC-k0+oeMc6haAB9kTmDNnLtqyQcg@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
	<CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
	<CAFZh4h8sm+V_QrvsdxiTmZC-k0+oeMc6haAB9kTmDNnLtqyQcg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2013 14:33:03 -0700
Message-ID: <CAMKF1spGQdR2HEoQS5TAPOfFvEsBZAPhQSFMqAE42GHcE+o11w@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Christopher Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2013 21:33:35 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1238c21c8804e41757af

--047d7bdc1238c21c8804e41757af
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 1:58 PM, Brian Hutchinson <b.hutchman@gmail.com>wro=
te:

> On Fri, Aug 16, 2013 at 11:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson <b.hutchman@gmail.com>=
wrote:
>>
>>>  At this point I'm using the toolchains outside of OE (meta-toolchain
>>> from denzil branch and Linaro 4.8) to make life a bit simpler.
>>
>>
>>
>> =E2=80=8Bcan you use the the toolchain from OE-Core and see if it happen=
s with
>> that too ?=E2=80=8B
>>
>>
> OK, that kept me busy for a while.  I built core-image-minimal -c
> populate_sdk with OE Core + meta-ti and installed that on my application
> development machine
>


good. So as I understand now you have a compiler from OE-Core
=E2=80=8B=E2=80=8B

>
> CPU: 0    Not tainted  (2.6.37+ #1)
> PC is at strcmp+0x10/0x48
> LR is at omap_mbox_get+0x40/0x1cc
> pc : [<c01dcd94>]    lr : [<c0061a50>]    psr: a0000013
> sp : ca023f10  ip : ca023f20  fp : ca023f1c
> r10: ca022018  r9 : 00000000  r8 : c04a20c0
> r7 : c049c5c8  r6 : c04a2798  r5 : c0408919  r4 : c047d898
> r3 : 00000000  r2 : 00000064  r1 : c0408919  r0 : 0000004c
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> Control: 10c5387d  Table: 80004019  DAC: 00000017
> Process swapper (pid: 1, stack limit =3D 0xca0222e8)
> Stack: (0xca023f10 to 0xca024000)
> 3f00:                                     ca023f44 ca023f20 c0061a50
> c01dcd90
> 3f20: c02b67c0 c01dcd90 c049c4a0 c049c56c c049c4a0 c0024ec8 ca023f6c
> ca023f48
> 3f40: c02b9fe4 c0061a1c 00000001 00000000 c002b040 c002b040 c04d1f08
> c006a954
> 3f60: ca023f94 ca023f70 c0024f04 c02b9e70 c002b040 c002b0d0 c006a954
> c0024ec8
> 3f80: c04a20c0 00000000 ca023fd4 ca023f98 c00373b8 c0024ed4 00000036
> 00000000
> 3fa0: ca023fbc 00000196 c04896cc c002b040 c002b0d0 c006a954 00000013
> 00000000
> 3fc0: 00000000 00000000 ca023ff4 ca023fd8 c0008d68 c003730c 00000000
> 00000000
> 3fe0: 00000000 c0008cc0 00000000 ca023ff8 c006a954 c0008ccc eda485b5
> b186e796
> Backtrace:
> [<c01dcd84>] (strcmp+0x0/0x48) from [<c0061a50>] (omap_mbox_get+0x40/0x1c=
c)
> [<c0061a10>] (omap_mbox_get+0x0/0x1cc) from [<c02b9fe4>]
> (notify_shm_drv_setup+0x180/0x254)
>  r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0
> [<c02b9e64>] (notify_shm_drv_setup+0x0/0x254) from [<c0024f04>]
> (notify_init+0x3c/0x2a8)
>  r6:c006a954 r5:c04d1f08 r4:c002b040
> [<c0024ec8>] (notify_init+0x0/0x2a8) from [<c00373b8>]
> (do_one_initcall+0xb8/0x180)
>  r9:00000000 r8:c04a20c0 r7:c0024ec8 r6:c006a954 r5:c002b0d0
> r4:c002b040
> [<c0037300>] (do_one_initcall+0x0/0x180) from [<c0008d68>]
> (kernel_init+0xa8/0x150)
> [<c0008cc0>] (kernel_init+0x0/0x150) from [<c006a954>] (do_exit+0x0/0x5dc=
)
>  r5:c0008cc0 r4:00000000
> Code: e1a0c00d e92dd800 e24cb004 e3a03000 (e7d02003)
> ---[ end trace 599d30e660dbf8fa ]---
> Kernel panic - not syncing: Attempted to kill init!
> Backtrace:
> [<c0044aec>] (dump_backtrace+0x0/0x104) from [<c0351cf0>]
> (dump_stack+0x18/0x1c)
>  r6:c01dcd96 r5:0000000b r4:c04a2858 r3:ffffffff
> [<c0351cd8>] (dump_stack+0x0/0x1c) from [<c0351ee0>] (panic+0x60/0x178)
> [<c0351e80>] (panic+0x0/0x178) from [<c006a9c0>] (do_exit+0x6c/0x5dc)
>  r3:c0480894 r2:ca020130 r1:00000001 r0:c040ad52
>  r7:ca022000
> [<c006a954>] (do_exit+0x0/0x5dc) from [<c0044f58>] (die+0x280/0x2bc)
>  r7:ca022000
> [<c0044cd8>] (die+0x0/0x2bc) from [<c0351d50>]
> (__do_kernel_fault.part.4+0x5c/0x7c)
> [<c0351cf4>] (__do_kernel_fault.part.4+0x0/0x7c) from [<c035862c>]
> (do_page_fault+0x200/0x21c)
>  r7:ca020000 r3:ca023ec8
> [<c035842c>] (do_page_fault+0x0/0x21c) from [<c035866c>]
> (do_translation_fault+0x24/0xa4)
> [<c0358648>] (do_translation_fault+0x0/0xa4) from [<c00371f8>]
> (do_DataAbort+0x3c/0xa0)
>  r7:ca023ec8 r6:0000004c r5:c046a550 r4:00000005
> [<c00371bc>] (do_DataAbort+0x0/0xa0) from [<c035672c>]
> (__dabt_svc+0x4c/0x60)
> Exception stack(0xca023ec8 to 0xca023f10)
> 3ec0:                   0000004c c0408919 00000064 00000000 c047d898
> c0408919
> 3ee0: c04a2798 c049c5c8 c04a20c0 00000000 ca022018 ca023f1c ca023f20
> ca023f10
> 3f00: c0061a50 c01dcd94 a0000013 ffffffff
>  r7:c049c5c8 r6:c04a2798 r5:ca023efc r4:ffffffff
> [<c01dcd84>] (strcmp+0x0/0x48) from [<c0061a50>] (omap_mbox_get+0x40/0x1c=
c)
> [<c0061a10>] (omap_mbox_get+0x0/0x1cc) from [<c02b9fe4>]
> (notify_shm_drv_setup+0x180/0x254)
>  r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0
> [<c02b9e64>] (notify_shm_drv_setup+0x0/0x254) from [<c0024f04>]
> (notify_init+0x3c/0x2a8)
>  r6:c006a954 r5:c04d1f08 r4:c002b040
> [<c0024ec8>] (notify_init+0x0/0x2a8) from [<c00373b8>]
> (do_one_initcall+0xb8/0x180)
>  r9:00000000 r8:c04a20c0 r7:c0024ec8 r6:c006a954 r5:c002b0d0
> r4:c002b040
> [<c0037300>] (do_one_initcall+0x0/0x180) from [<c0008d68>]
> (kernel_init+0xa8/0x150)
> [<c0008cc0>] (kernel_init+0x0/0x150) from [<c006a954>] (do_exit+0x0/0x5dc=
)
>  r5:c0008cc0 r4:00000000
>

=E2=80=8BThis needs to be debugged. Since 3.x kernels works fine with gcc 4=
.8.x, I
would assume its something that got fixed in kernel along the way. You have
to hunt
I dont have neither the platform nor another device where I use 2.6.37 so
cant help much with hunt




>
> To build the above, I simple sourced the
> /usr/local/oecore-i686/environment-setup-armv7a-vfp-neon-oe-linux-gnueabi
> script and then unset LDFLAGS.
>
> For kicks, I did a clean build of the kernel again and built with make
> EXTRA_CFLAGS=3D-mno-unaligned-access uImage and that resulted in a hung
> kernel:
>
> ## Booting kernel from Legacy Image at 83000000 ...
>    Image Name:   Linux-2.6.37+
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2348876 Bytes =3D 2.2 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
>
> Regards,
>
> Brian
>

--047d7bdc1238c21c8804e41757af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace;font-size:small"><br></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Fri, Aug 16, 2013 at 1:58 PM, Brian Hutchins=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"=
_blank">b.hutchman@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"h5">On F=
ri, Aug 16, 2013 at 11:37 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br>

</div></div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div=
 class=3D"h5">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div><div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinso=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"_=
blank">b.hutchman@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">=C2=A0At this point I&#39;m using the toolchains outside o=
f OE (meta-toolchain from denzil branch and Linaro 4.8) to make life a bit =
simpler.</blockquote>




</div><br><br></div></div><div class=3D"gmail_extra"><div>=E2=80=8Bcan you =
use the the toolchain from OE-Core and see if it happens with that too ?=E2=
=80=8B</div>

<br></div></div></blockquote><div><br></div></div></div><div>OK, that kept =
me busy for a while. =C2=A0I built core-image-minimal -c populate_sdk with =
OE Core + meta-ti and installed that on my application development machine<=
/div>

</div></div></div></blockquote><div><br></div><div><br></div><div style=3D"=
font-family:&#39;courier new&#39;,monospace;font-size:small" class=3D"gmail=
_default">good. So as I understand now you have a compiler from OE-Core</di=
v>

<div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" =
class=3D"gmail_default">=E2=80=8B=E2=80=8B</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote"><div><br></div><div><div>CPU: 0 =C2=A0 =C2=A0Not=
 tainted =C2=A0(2.6.37+ #1)</div><div>PC is at strcmp+0x10/0x48</div>
<div>LR is at omap_mbox_get+0x40/0x1cc</div><div>pc : [&lt;c01dcd94&gt;] =
=C2=A0 =C2=A0lr : [&lt;c0061a50&gt;] =C2=A0 =C2=A0psr: a0000013</div><div>s=
p : ca023f10 =C2=A0ip : ca023f20 =C2=A0fp : ca023f1c</div><div>r10: ca02201=
8 =C2=A0r9 : 00000000 =C2=A0r8 : c04a20c0</div>


<div>r7 : c049c5c8 =C2=A0r6 : c04a2798 =C2=A0r5 : c0408919 =C2=A0r4 : c047d=
898</div><div>r3 : 00000000 =C2=A0r2 : 00000064 =C2=A0r1 : c0408919 =C2=A0r=
0 : 0000004c</div><div>Flags: NzCv =C2=A0IRQs on =C2=A0FIQs on =C2=A0Mode S=
VC_32 =C2=A0ISA ARM =C2=A0Segment kernel</div><div>


Control: 10c5387d =C2=A0Table: 80004019 =C2=A0DAC: 00000017</div><div>Proce=
ss swapper (pid: 1, stack limit =3D 0xca0222e8)</div><div>Stack: (0xca023f1=
0 to 0xca024000)</div><div>3f00: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ca023f44 ca023f20 c0061a50 c01dcd90</div>


<div>3f20: c02b67c0 c01dcd90 c049c4a0 c049c56c c049c4a0 c0024ec8 ca023f6c c=
a023f48</div><div>3f40: c02b9fe4 c0061a1c 00000001 00000000 c002b040 c002b0=
40 c04d1f08 c006a954</div><div>3f60: ca023f94 ca023f70 c0024f04 c02b9e70 c0=
02b040 c002b0d0 c006a954 c0024ec8</div>


<div>3f80: c04a20c0 00000000 ca023fd4 ca023f98 c00373b8 c0024ed4 00000036 0=
0000000</div><div>3fa0: ca023fbc 00000196 c04896cc c002b040 c002b0d0 c006a9=
54 00000013 00000000</div><div>3fc0: 00000000 00000000 ca023ff4 ca023fd8 c0=
008d68 c003730c 00000000 00000000</div>


<div>3fe0: 00000000 c0008cc0 00000000 ca023ff8 c006a954 c0008ccc eda485b5 b=
186e796</div><div>Backtrace:=C2=A0</div><div>[&lt;c01dcd84&gt;] (strcmp+0x0=
/0x48) from [&lt;c0061a50&gt;] (omap_mbox_get+0x40/0x1cc)</div><div>[&lt;c0=
061a10&gt;] (omap_mbox_get+0x0/0x1cc) from [&lt;c02b9fe4&gt;] (notify_shm_d=
rv_setup+0x180/0x254)</div>


<div>=C2=A0r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0</div><div>[&lt;c=
02b9e64&gt;] (notify_shm_drv_setup+0x0/0x254) from [&lt;c0024f04&gt;] (noti=
fy_init+0x3c/0x2a8)</div><div>=C2=A0r6:c006a954 r5:c04d1f08 r4:c002b040</di=
v><div>


[&lt;c0024ec8&gt;] (notify_init+0x0/0x2a8) from [&lt;c00373b8&gt;] (do_one_=
initcall+0xb8/0x180)</div><div>=C2=A0r9:00000000 r8:c04a20c0 r7:c0024ec8 r6=
:c006a954 r5:c002b0d0</div><div>r4:c002b040</div><div>[&lt;c0037300&gt;] (d=
o_one_initcall+0x0/0x180) from [&lt;c0008d68&gt;] (kernel_init+0xa8/0x150)<=
/div>


<div>[&lt;c0008cc0&gt;] (kernel_init+0x0/0x150) from [&lt;c006a954&gt;] (do=
_exit+0x0/0x5dc)</div><div>=C2=A0r5:c0008cc0 r4:00000000</div><div>Code: e1=
a0c00d e92dd800 e24cb004 e3a03000 (e7d02003)=C2=A0</div><div>---[ end trace=
 599d30e660dbf8fa ]---</div>


<div>Kernel panic - not syncing: Attempted to kill init!</div><div>Backtrac=
e:=C2=A0</div><div>[&lt;c0044aec&gt;] (dump_backtrace+0x0/0x104) from [&lt;=
c0351cf0&gt;] (dump_stack+0x18/0x1c)</div><div>=C2=A0r6:c01dcd96 r5:0000000=
b r4:c04a2858 r3:ffffffff</div>


<div>[&lt;c0351cd8&gt;] (dump_stack+0x0/0x1c) from [&lt;c0351ee0&gt;] (pani=
c+0x60/0x178)</div><div>[&lt;c0351e80&gt;] (panic+0x0/0x178) from [&lt;c006=
a9c0&gt;] (do_exit+0x6c/0x5dc)</div><div>=C2=A0r3:c0480894 r2:ca020130 r1:0=
0000001 r0:c040ad52</div>


<div>=C2=A0r7:ca022000</div><div>[&lt;c006a954&gt;] (do_exit+0x0/0x5dc) fro=
m [&lt;c0044f58&gt;] (die+0x280/0x2bc)</div><div>=C2=A0r7:ca022000</div><di=
v>[&lt;c0044cd8&gt;] (die+0x0/0x2bc) from [&lt;c0351d50&gt;] (__do_kernel_f=
ault.part.4+0x5c/0x7c)</div>


<div>[&lt;c0351cf4&gt;] (__do_kernel_fault.part.4+0x0/0x7c) from [&lt;c0358=
62c&gt;] (do_page_fault+0x200/0x21c)</div><div>=C2=A0r7:ca020000 r3:ca023ec=
8</div><div>[&lt;c035842c&gt;] (do_page_fault+0x0/0x21c) from [&lt;c035866c=
&gt;] (do_translation_fault+0x24/0xa4)</div>


<div>[&lt;c0358648&gt;] (do_translation_fault+0x0/0xa4) from [&lt;c00371f8&=
gt;] (do_DataAbort+0x3c/0xa0)</div><div>=C2=A0r7:ca023ec8 r6:0000004c r5:c0=
46a550 r4:00000005</div><div>[&lt;c00371bc&gt;] (do_DataAbort+0x0/0xa0) fro=
m [&lt;c035672c&gt;] (__dabt_svc+0x4c/0x60)</div>


<div>Exception stack(0xca023ec8 to 0xca023f10)</div><div>3ec0: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000004c c0408919 0000=
0064 00000000 c047d898 c0408919</div><div>3ee0: c04a2798 c049c5c8 c04a20c0 =
00000000 ca022018 ca023f1c ca023f20 ca023f10</div>


<div>3f00: c0061a50 c01dcd94 a0000013 ffffffff</div><div>=C2=A0r7:c049c5c8 =
r6:c04a2798 r5:ca023efc r4:ffffffff</div><div>[&lt;c01dcd84&gt;] (strcmp+0x=
0/0x48) from [&lt;c0061a50&gt;] (omap_mbox_get+0x40/0x1cc)</div><div>[&lt;c=
0061a10&gt;] (omap_mbox_get+0x0/0x1cc) from [&lt;c02b9fe4&gt;] (notify_shm_=
drv_setup+0x180/0x254)</div>


<div>=C2=A0r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0</div><div>[&lt;c=
02b9e64&gt;] (notify_shm_drv_setup+0x0/0x254) from [&lt;c0024f04&gt;] (noti=
fy_init+0x3c/0x2a8)</div><div>=C2=A0r6:c006a954 r5:c04d1f08 r4:c002b040</di=
v><div>


[&lt;c0024ec8&gt;] (notify_init+0x0/0x2a8) from [&lt;c00373b8&gt;] (do_one_=
initcall+0xb8/0x180)</div><div>=C2=A0r9:00000000 r8:c04a20c0 r7:c0024ec8 r6=
:c006a954 r5:c002b0d0</div><div>r4:c002b040</div><div>[&lt;c0037300&gt;] (d=
o_one_initcall+0x0/0x180) from [&lt;c0008d68&gt;] (kernel_init+0xa8/0x150)<=
/div>


<div>[&lt;c0008cc0&gt;] (kernel_init+0x0/0x150) from [&lt;c006a954&gt;] (do=
_exit+0x0/0x5dc)</div><div>=C2=A0r5:c0008cc0 r4:00000000</div></div></div><=
/div></div></blockquote><div><br></div><div><div style=3D"font-family:&#39;=
courier new&#39;,monospace;font-size:small" class=3D"gmail_default">

=E2=80=8BThis needs to be debugged. Since 3.x kernels works fine with gcc 4=
.8.x, I would assume its something that got fixed in kernel along the way. =
You have to hunt</div><div style=3D"font-family:&#39;courier new&#39;,monos=
pace;font-size:small" class=3D"gmail_default">

I dont have neither the platform nor another device where I use 2.6.37 so c=
ant help much with hunt</div><br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><br></div></div>To build the above, I simple sourced the /usr/local/oecore=
-i686/environment-setup-armv7a-vfp-neon-oe-linux-gnueabi script and then un=
set LDFLAGS.</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For kicks, =
I did a clean build of the kernel again and built with=C2=A0make EXTRA_CFLA=
GS=3D-mno-unaligned-access uImage and that resulted in a hung kernel:</div>=
<div class=3D"gmail_extra">


<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">## Booting =
kernel from Legacy Image at 83000000 ...</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37+</div><div class=3D"gmail_extr=
a">=C2=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</d=
iv>


<div class=3D"gmail_extra">=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A02348876 Byt=
es =3D 2.2 MiB</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Load Address: 8=
0008000</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Entry Point: =C2=A0800=
08000</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Verifying Checksum ... O=
K</div>


<div class=3D"gmail_extra">=C2=A0 =C2=A0Loading Kernel Image ... OK</div><d=
iv class=3D"gmail_extra">OK</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Starting kernel ...</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">


<br></div><div class=3D"gmail_extra">Regards,</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Brian</div></div></div>
</blockquote></div><br></div></div>

--047d7bdc1238c21c8804e41757af--
