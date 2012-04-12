Return-Path: <marco.monguzzi@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B7A0E01374
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 07:42:20 -0700 (PDT)
Received: by obbuo19 with SMTP id uo19so3967390obb.35
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2012 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HzcPJ+x9iQ+FYr2X20kWcelzl1POvhsjOiAJOjhuJ34=;
	b=myoc/5MFF+PlBtw33rymv6Sk2P1ejUgcsX+/0wjQ71XPpDi60JknODxS4b6iO9cyPg
	BcddFKTwMv7PaxXMmxXpJkkV40xVxl+FUTqzd7fq4Z6EdOBmTrWNsvRCxEz3h44Pxoyu
	4ZRGudVQNxDZJ+GdV9d0m46mEnGbMU3ZXQjYU3RwVcAuOmSJTNlbw7hfm4FFD/MBzmTA
	qOpY9IYK/omAT9gibpHrkP9RiUUHRd2+gpIUZNsfEXu/9jnpjh4pDN9xNFHxqRc02SlV
	a761g7KBphtEUHO/xq6sgTzu1CU6YI8YzQhG5Qw/pP8Oy9YqoxSU6FSrSNLjfbPFHwtH
	dMDw==
MIME-Version: 1.0
Received: by 10.182.13.99 with SMTP id g3mr3433588obc.22.1334241739712; Thu,
	12 Apr 2012 07:42:19 -0700 (PDT)
Received: by 10.182.28.134 with HTTP; Thu, 12 Apr 2012 07:42:19 -0700 (PDT)
In-Reply-To: <4F7EF99A.7040700@mlbassoc.com>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
	<CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
	<4F7EF99A.7040700@mlbassoc.com>
Date: Thu, 12 Apr 2012 16:42:19 +0200
Message-ID: <CALKp9+bY6+mzJLSpBBmZNZZKmnh1QD+Hs8NCRt+XGLyF-N88AA@mail.gmail.com>
From: Marco Monguzzi <marco.monguzzi@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 14:42:20 -0000
Content-Type: multipart/alternative; boundary=f46d0444ef07f0a70a04bd7c5cc8

--f46d0444ef07f0a70a04bd7c5cc8
Content-Type: text/plain; charset=ISO-8859-1

Hi Gary,

this may work for me too.

Is there a way to stick with the TI recommended toolchain?
(gcc-4.5 + Linaro patches and binutils-2.20.1)

Adding:

GCCVERSION = "4.5%"
BINUVERSION = "2.20.1"

to my conf/local.conf appears being ignored (tried with a 1.2_M4.rc3
snapshot).

Thanks in advance for your time.

Regards.


> Workarounds:
> * There is still one recipe in meta-ti that causes a parse error
>    ERROR: ParseError at /home/local/poky-multi/meta-**
> ti/recipes-misc/payload/bonesc**ript.bb:5 <http://bonescript.bb:5>: Could
> not inherit file classes/systemd.bbclass
>  To work around this, add this to your conf/local.conf
>    BBMASK ?= ".*/meta-ti/recipes-misc/**payload/bonescript*"
> * The beaglebone kernel can't be built with its default configuration
> using the
>  GCC-4.6.x/BINUTILS-2.22.  It will build with the attached patch which
> disables
>  THUMB2_KERNEL mode.  Simply apply it to your local copy of meta-ti
> * If you want to build the TI kernel for the beagleboard, add this to
> conf/local.conf
>    PREFERRED_PROVIDER_virtual/**kernel ?= "linux-omap-psp"
>
>

--f46d0444ef07f0a70a04bd7c5cc8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><div>Hi Gary,</div><div><br></div><div>this may =
work for me too.=A0</div><div><br></div><div>Is there a way to stick with t=
he TI recommended toolchain?</div><div><div>(gcc-4.5 + Linaro patches and=
=A0binutils-2.20.1)</div>
</div><div><br></div><div>Adding:</div><div><div><br></div><div>GCCVERSION =
=3D &quot;4.5%&quot;</div><div>BINUVERSION =3D &quot;2.20.1&quot;</div></di=
v><div><br></div><div>to my conf/local.conf appears being ignored=A0(tried =
with a 1.2_M4.rc3 snapshot).</div>
<div><br></div><div>Thanks in advance for your time.</div><div><br></div><d=
iv>Regards.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Workarounds:<br>
* There is still one recipe in meta-ti that causes a parse error<br>
 =A0 =A0ERROR: ParseError at /home/local/poky-multi/meta-<u></u>ti/recipes-=
misc/payload/<a href=3D"http://bonescript.bb:5" target=3D"_blank">bonesc<u>=
</u>ript.bb:5</a>: Could not inherit file classes/systemd.bbclass<br>
 =A0To work around this, add this to your conf/local.conf<br>
 =A0 =A0BBMASK ?=3D &quot;.*/meta-ti/recipes-misc/<u></u>payload/bonescript=
*&quot;<br>
* The beaglebone kernel can&#39;t be built with its default configuration u=
sing the<br>
 =A0GCC-4.6.x/BINUTILS-2.22. =A0It will build with the attached patch which=
 disables<br>
 =A0THUMB2_KERNEL mode. =A0Simply apply it to your local copy of meta-ti<br=
>
* If you want to build the TI kernel for the beagleboard, add this to conf/=
local.conf<br>
 =A0 =A0PREFERRED_PROVIDER_virtual/<u></u>kernel ?=3D &quot;linux-omap-psp&=
quot;<br>
<br></blockquote></div>

--f46d0444ef07f0a70a04bd7c5cc8--
