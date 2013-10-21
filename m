Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82B5BE013B7
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 10:42:37 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id e50so2301768eek.7
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lqUStjH8QTXCgl/fU4bNnHNgDKsyKmOCBIuaq/uNuFs=;
	b=I2ObH5thT6b7Ermi4GKBzD9EdqxaoxxMLaALPYXk134JvbzTaoiR3W0WcNfvXknTpJ
	i2mhxVVmsYZp/0pCJbx9TS7v4zVq+VGUryehAfqWCSHsOZYRhPHr8fEGgaqF5hZhLpNe
	bx7awYbmd66q/wnxuyEsqPTTzJWYFf7jJJ5z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lqUStjH8QTXCgl/fU4bNnHNgDKsyKmOCBIuaq/uNuFs=;
	b=clNROAnTWGL59/aLEHWTo913Sj+W5XyQk237oMO3QRPqhhNODraKLanU5MutkstYPV
	nFqJoWk8xHKBd7jbq5ubPwrrCz6x5tMrBoTcIQXRjzzQNLqBYlM7sNCrAmovWdjpqabM
	V6Ukd2yJcUUAJoujvFOn1/aA1oA5O9lTXC7IZfYhInHhFXxPhS5AwhlUDK6K2G5vg9JQ
	VEtm8NczGfYXDdTauU/KLY858UDs94LBqhkJv3MiqCle3iXSv0UYcStHXfR7GRxSuHYa
	BWjrc0HGyA23ItpPSOMOSScupbsvZM6RbV0973rOaJx+4LJBZwQKQGGVvsNoenpIpkLm
	PCDQ==
X-Gm-Message-State: ALoCoQmFP4dCcISuoiErYN7ncQV6hwh3s+3D9jziGj9EWhGSMZ5n9AGh3owY2yoAo0Ux73RurVHN
MIME-Version: 1.0
X-Received: by 10.14.98.194 with SMTP id v42mr3412056eef.76.1382377355968;
	Mon, 21 Oct 2013 10:42:35 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Mon, 21 Oct 2013 10:42:35 -0700 (PDT)
In-Reply-To: <CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
	<CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
Date: Mon, 21 Oct 2013 10:42:35 -0700
Message-ID: <CA+gsK-qaWVUGPe7fW62V+tH0F3GVZHHXGD_+LHQX7hiE7VcZRg@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Mon, 21 Oct 2013 17:42:39 -0000
Content-Type: multipart/alternative; boundary=001a11c376403f927204e943cf73

--001a11c376403f927204e943cf73
Content-Type: text/plain; charset=ISO-8859-1

Since the 3.12-rc5 kernel does not work I decided to give the 3.8 kernel a
try. The issue with this one is that the linux-ti-staging_3.8.bb recipe
explicitly sets KERNEL_IMAGETYPE="uImage". However, the u-boot environment
has now moved on to using zImage which consequently means u-boot will not
find the kernel file.

I do not know why KERNEL_IMAGETYPE = "uImage" was hacked into the
linux-ti-staging_3.8.bb recipe but whoever did it did not think about
u-boot. Does zImage not work with 3.8? I did not try it but it should
normally have no effect. Since there is no dependency of the u-boot recipes
on the kernel image types changes to the kernel image type for newer
versions of the kernel then automatically means that it must be changed for
the previous versions too.

I mocked around with the u-boot environment and booted the 3.8 uImage
kernel. To my surprise the 3.8 kernel from the TI staging repository fails
with the exact same problem and stops booting with a kernel not syncing
message during the init calls. Apparently a patch must have been applied to
the kernel repo that breaks it. It has nothing possibly to do with the
build system.

I would appreciate any hints to get this kernel built and boot on the board.

Thanks,
Rudi


On Mon, Oct 21, 2013 at 1:16 AM, Rudolf Streif
<rstreif@linuxfoundation.org>wrote:

> Denys,
>
> I recompiled the 3.12-rc5 kernel again but it still stalls during
> initialization. I attached the boot log. I don't know much about the
> platform details but maybe that's an issue you know about.
>
> Thanks,
> Rudi
>
>
>
>>
>> [1]
>> Build Configuration:
>> BB_VERSION        = "1.21.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Fedora-18"
>> TARGET_SYS        = "arm-poky-linux-gnueabi"
>> MACHINE           = "am335x-evm"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "1.5+snapshot-20131019"
>> TUNE_FEATURES     = "armv7a vfp neon"
>> TARGET_FPU        = "vfp-neon"
>> meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
>> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
>> meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
>> meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
>>
>>
>
>
>
>
>


-- 
-- 
*Rudolf J. Streif*
Director of Embedded Solutions
The Linux Foundation

rudolf.streif@linux.com
Phone: +1.619.537.6646
Skype: rudolfstreif
PGP: RSA 2048/2048 D6E7D28B

Linux Foundation Events Schedule:  events.linuxfoundation.org
Linux Foundation Training Schedule: training.linuxfoundation.org

--001a11c376403f927204e943cf73
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Since the 3.12-rc5 kernel does not work I decided to give =
the 3.8 kernel a try. The issue with this one is that the <a href=3D"http:/=
/linux-ti-staging_3.8.bb">linux-ti-staging_3.8.bb</a> recipe explicitly set=
s KERNEL_IMAGETYPE=3D&quot;uImage&quot;. However, the u-boot environment ha=
s now moved on to using zImage which consequently means u-boot will not fin=
d the kernel file.<div>
<br></div><div>I do not know why KERNEL_IMAGETYPE =3D &quot;uImage&quot; wa=
s hacked into the <a href=3D"http://linux-ti-staging_3.8.bb">linux-ti-stagi=
ng_3.8.bb</a> recipe but whoever did it did not think about u-boot. Does zI=
mage not work with 3.8? I did not try it but it should normally have no eff=
ect. Since there is no dependency of the u-boot recipes on the kernel image=
 types changes to the kernel image type for newer versions of the kernel th=
en automatically means that it must be changed for the previous versions to=
o.</div>
<div><br></div><div>I mocked around with the u-boot environment and booted =
the 3.8 uImage kernel. To my surprise the 3.8 kernel from the TI staging re=
pository fails with the exact same problem and stops booting with a kernel =
not syncing message during the init calls. Apparently a patch must have bee=
n applied to the kernel repo that breaks it. It has nothing possibly to do =
with the build system.</div>
<div><br></div><div>I would appreciate any hints to get this kernel built a=
nd boot on the board.</div><div><br></div><div>Thanks,</div><div>Rudi</div>=
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon,=
 Oct 21, 2013 at 1:16 AM, Rudolf Streif <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rstreif@linuxfoundation.org" target=3D"_blank">rstreif@linuxfoundation=
.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Denys,</div><div><br><=
/div><div>I recompiled the 3.12-rc5 kernel again but it still stalls during=
 initialization. I attached the boot log. I don&#39;t know much about the p=
latform details but maybe that&#39;s an issue you know about.</div>
<div class=3D"im">
<div><br></div><div>Thanks,</div><div>Rudi</div><div><br></div><br><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><br></div><div><br></div><div>[1]</div><div><div>Build Configuration:</div=
><div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;</div><div>BUILD_SYS =
=A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;</div>

<div>NATIVELSBSTRING =A0 =3D &quot;Fedora-18&quot;</div>
<div>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-gnueabi&quot;</div>=
<div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&quot;</div><div>DISTR=
O =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =A0 =
=A0=3D &quot;1.5+snapshot-20131019&quot;</div>


<div>TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quot;</div><div>TARGET=
_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;</div><div>meta-yocto =A0 =A0 =
=A0 =A0=3D &quot;master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot;</div=
><div>meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504664990f007c3903d34=
9e7cc135a904f8e2&quot;</div>


<div>meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;master:f8903f53db717294d63a8d79b=
5ef7ca34b3c189e&quot;</div><div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;m=
aster:9a1dce10bdc9254bb38e0e54199f23ae55e209a4&quot; =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>


</div></div>
</div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div><div dir=3D"ltr"><d=
iv><font face=3D"garamond, serif"><span style=3D"border-collapse:collapse;c=
olor:rgb(102,102,102);font-family:arial,sans-serif;font-size:13px"><br></sp=
an></font></div>

</div>
</div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr">--=A0<br><font face=3D"arial, helvetica, sans-serif"><b>Rudolf J. Stre=
if</b></font><div><font face=3D"arial, helvetica, sans-serif">Director of E=
mbedded Solutions</font></div>
<div><font face=3D"arial, helvetica, sans-serif">The Linux Foundation</font=
></div><div><font face=3D"arial, helvetica, sans-serif"><br></font></div><d=
iv><a href=3D"mailto:rudolf.streif@linux.com" target=3D"_blank"><font face=
=3D"arial, helvetica, sans-serif">rudolf.streif@linux.com</font></a></div>
<div><font face=3D"arial, helvetica, sans-serif">Phone: +1.619.</font><span=
 style=3D"color:rgb(0,0,0);font-family:Arial,sans-serif;line-height:18.1875=
px">537.6646</span></div><div><font face=3D"arial, helvetica, sans-serif">S=
kype: rudolfstreif</font></div>
<div><font face=3D"arial, helvetica, sans-serif">PGP: RSA 2048/2048 D6E7D28=
B</font></div><div><font face=3D"garamond, serif"><br></font></div><div><fo=
nt face=3D"garamond, serif"><span style=3D"border-collapse:collapse;color:r=
gb(102,102,102);font-family:arial,sans-serif;font-size:13px"><span style=3D=
"border-collapse:collapse">Linux Foundation Events Schedule: =A0<a href=3D"=
http://events.linuxfoundation.org/" style=3D"color:rgb(64,100,128)" target=
=3D"_blank">events.linuxfoundation.org</a><br>
Linux Foundation Training Schedule:=A0<a href=3D"http://training.linuxfound=
ation.org/" style=3D"color:rgb(64,100,128)" target=3D"_blank">training.linu=
xfoundation.org</a></span><br></span></font></div><div><font face=3D"garamo=
nd, serif"><span style=3D"border-collapse:collapse;color:rgb(102,102,102);f=
ont-family:arial,sans-serif;font-size:13px"><br>
</span></font></div></div>
</div>

--001a11c376403f927204e943cf73--
