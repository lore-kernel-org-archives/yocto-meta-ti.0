Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 212A3E01715
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 01:16:06 -0700 (PDT)
Received: by mail-ee0-f44.google.com with SMTP id b47so3411927eek.17
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iapKlf/fFnN+sVAG6t9RBZG7NfaIIFMLDR+TqrE4YvU=;
	b=cIfXwfMKZAriDOjRgBa1QYJFBLzCt3L3xqPS8qWXIfJkqVtEckH/vxWcHa70MDGQXE
	2QcM2W+qFsZHIZUct2GuH5fO5wnFNJLs1WPTn62w6EjI0rFWbwehvJEC3ByIFtarlfr5
	6JqsUc5WFeVEGcEq60ecSWaHWwu0CK/zQ/45M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iapKlf/fFnN+sVAG6t9RBZG7NfaIIFMLDR+TqrE4YvU=;
	b=gZBOQsybFJUPrGGIUs2JN6G3siOaLFsaSSOV5kO91MFdTSCrMXmXdpWRbaobDn3O6x
	r+ToecwXkOdJX8TpBsr4r2Id9kpVzTDlrziuPOdfRAZkGPCt6HgCqo0sPNwjGg6lJSDr
	yPbKUvjNVExDFVjcAbgS9fnwruEZyVzPtBAoikiXw5dxncTnJwtO6sjhzSBTKiPsuwdL
	cmud/dbHTyPoi1DF47gMQMaTgr42ecUiRcMrKpTHCxBHWOr+Tswf9c6f/AE1qG+9W9Fe
	M/pZzsXPxXftNiqtCDni5gHDmFICO/8I8ZtoXcXyZ2GRyK8lZs4aqa0tiGKasV2hiiWr
	yoQQ==
X-Gm-Message-State: ALoCoQkzoXxpF2+V0U5c7GjDnVJ0B68OoUDQI76aPiKIBMoQ2C4SbAdg9Eoq1yM1bsKTdMiLuTPe
MIME-Version: 1.0
X-Received: by 10.15.91.3 with SMTP id r3mr21474996eez.4.1382343364721; Mon,
	21 Oct 2013 01:16:04 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Mon, 21 Oct 2013 01:16:04 -0700 (PDT)
In-Reply-To: <CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
	<20131019023954.GK2127@edge>
	<CA+gsK-q8W-wAP-rBhy7RgHUddsbdE_SaNOgyfFQ+zj2ksSidKw@mail.gmail.com>
Date: Mon, 21 Oct 2013 01:16:04 -0700
Message-ID: <CA+gsK-owJQGEhzv9tgmiF+fORTErYVbQUhcoQ3BVLA+p3a+9Qw@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Oct 2013 08:16:07 -0000
X-Groupsio-MsgNum: 3549
Content-Type: multipart/mixed; boundary=089e016354b6365fce04e93be561

--089e016354b6365fce04e93be561
Content-Type: multipart/alternative; boundary=089e016354b6365fcb04e93be55f

--089e016354b6365fcb04e93be55f
Content-Type: text/plain; charset=ISO-8859-1

Denys,

I recompiled the 3.12-rc5 kernel again but it still stalls during
initialization. I attached the boot log. I don't know much about the
platform details but maybe that's an issue you know about.

Thanks,
Rudi



>
> [1]
> Build Configuration:
> BB_VERSION        = "1.21.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Fedora-18"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5+snapshot-20131019"
> TUNE_FEATURES     = "armv7a vfp neon"
> TARGET_FPU        = "vfp-neon"
> meta-yocto        = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> meta-oe           = "master:f8903f53db717294d63a8d79b5ef7ca34b3c189e"
> meta              = "master:9a1dce10bdc9254bb38e0e54199f23ae55e209a4"
>
>

--089e016354b6365fcb04e93be55f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Denys,</div><div><br></div><div>I recompiled the 3.12=
-rc5 kernel again but it still stalls during initialization. I attached the=
 boot log. I don&#39;t know much about the platform details but maybe that&=
#39;s an issue you know about.</div>
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
</div></div>

--089e016354b6365fcb04e93be55f--

--089e016354b6365fce04e93be561
Content-Type: application/octet-stream; name="am335x-evm.log"
Content-Disposition: attachment; filename="am335x-evm.log"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hn1fjmf80

WyAgICAyLjYwNzkxMF0gWzxjMDJmODk5ND5dIChncGlvX2RlYm91bmNlKzB4NzgvMHgxMmMpIGZy
b20gWzxjMDJmNjE4MD5dIChncGlvX3NldF9kZWJvdW5jZSsweDk0LzB4MTE4KQpbICAgIDIuNjE3
NTE2XSBbPGMwMmY2MTgwPl0gKGdwaW9fc2V0X2RlYm91bmNlKzB4OTQvMHgxMTgpIGZyb20gWzxj
MDQ1YjgyOD5dIChncGlvX2tleXNfcHJvYmUrMHgzYzQvMHg3YzQpClsgICAgMi42Mjc0MDNdIFs8
YzA0NWI4Mjg+XSAoZ3Bpb19rZXlzX3Byb2JlKzB4M2M0LzB4N2M0KSBmcm9tIFs8YzAzNTMzMWM+
XSAocGxhdGZvcm1fZHJ2X3Byb2JlKzB4MTgvMHgxYykKWyAgICAyLjYzNzI3OV0gWzxjMDM1MzMx
Yz5dIChwbGF0Zm9ybV9kcnZfcHJvYmUrMHgxOC8weDFjKSBmcm9tIFs8YzAzNTIxMTQ+XSAoZHJp
dmVyX3Byb2JlX2RldmljZSsweDEwOC8weDIyNCkKWyAgICAyLjY0NzUxOV0gWzxjMDM1MjExND5d
IChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MTA4LzB4MjI0KSBmcm9tIFs8YzAzNTIzMDg+XSAoX19k
cml2ZXJfYXR0YWNoKzB4OTQvMHg5OCkKWyAgICAyLjY1NzQ4Nl0gWzxjMDM1MjMwOD5dIChfX2Ry
aXZlcl9hdHRhY2grMHg5NC8weDk4KSBmcm9tIFs8YzAzNTA1OTg+XSAoYnVzX2Zvcl9lYWNoX2Rl
disweDYwLzB4OTQpClsgICAgMi42NjY5OTVdIFs8YzAzNTA1OTg+XSAoYnVzX2Zvcl9lYWNoX2Rl
disweDYwLzB4OTQpIGZyb20gWzxjMDM1MTg5OD5dIChidXNfYWRkX2RyaXZlcisweDFkNC8weDI4
NCkKWyAgICAyLjY3NjU5N10gWzxjMDM1MTg5OD5dIChidXNfYWRkX2RyaXZlcisweDFkNC8weDI4
NCkgZnJvbSBbPGMwMzUyOGUwPl0gKGRyaXZlcl9yZWdpc3RlcisweDc4LzB4ZjgpClsgICAgMi42
ODYxMTJdIFs8YzAzNTI4ZTA+XSAoZHJpdmVyX3JlZ2lzdGVyKzB4NzgvMHhmOCkgZnJvbSBbPGMw
MDA4ODQ4Pl0gKGRvX29uZV9pbml0Y2FsbCsweGU4LzB4MTRjKQpbICAgIDIuNjk1NjI3XSBbPGMw
MDA4ODQ4Pl0gKGRvX29uZV9pbml0Y2FsbCsweGU4LzB4MTRjKSBmcm9tIFs8YzA3ZmNiYmM+XSAo
a2VybmVsX2luaXRfZnJlZWFibGUrMHgxMDQvMHgxYzgpClsgICAgMi43MDU3ODldIFs8YzA3ZmNi
YmM+XSAoa2VybmVsX2luaXRfZnJlZWFibGUrMHgxMDQvMHgxYzgpIGZyb20gWzxjMDU4NGI1OD5d
IChrZXJuZWxfaW5pdCsweDgvMHgxNTApClsgICAgMi43MTU0OTRdIFs8YzA1ODRiNTg+XSAoa2Vy
bmVsX2luaXQrMHg4LzB4MTUwKSBmcm9tIFs8YzAwMTNiYzg+XSAocmV0X2Zyb21fZm9yaysweDE0
LzB4MmMpClsgICAgMi43MjQzNjRdIENvZGU6IGU1OTQzMDljIGU1MTQyMDcwIGUxZDMzMWJlIGUw
ODIzMDAzIChlNTkzMjAwMCkgClsgICAgMi43MzA3ODRdIC0tLVsgZW5kIHRyYWNlIDNiY2VlYjdl
Mzg3M2NhNjIgXS0tLQpbICAgIDIuNzM1OTU0XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzog
QXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYgo=

--089e016354b6365fce04e93be561--
