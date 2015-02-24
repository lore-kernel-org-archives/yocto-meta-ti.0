Return-Path: <aravind.nizam79@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 470D1E008CC; Tue, 24 Feb 2015 01:35:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aravind.nizam79[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07E1CE00712
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 01:35:04 -0800 (PST)
Received: by mail-oi0-f42.google.com with SMTP id h136so18307970oig.1
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=foxfJ1008/XLUPL+zH6ZWsGxX3KD3wpVVuZnLRdzLnM=;
	b=TcVJbHSXFoxCBew5sqWSexlqBlRkS1wsem4rsx3QI+elgWb7M1+mk7hY6A/PxE1ueC
	fbH4qcm0hifeZOUXM0jMIsin7THIhbk52rEXf9hOaDKtnfrjZC0mpDaF2/GIfguQFWog
	cFjaOgxUxC6v2uSUSNF24M0MhY2sha/EsT9XaLDMoT373FDXb+uQIMaimgaywOqFhIcx
	GIjq1OnkfFYroCTOag0ad31OVNYXnC+sCFpbzf6ygZU9c/nrcYoOI2qJhSFzAFpw4Sf8
	PKPBtY9+AoIKy4YiVcUjS7x6OVsNDLy5+67hs8nMeq+YKIQeR01Iihe0Br70IVXyxCvB
	sc8A==
MIME-Version: 1.0
X-Received: by 10.202.212.214 with SMTP id l205mr9634479oig.117.1424770503574; 
	Tue, 24 Feb 2015 01:35:03 -0800 (PST)
Received: by 10.182.120.168 with HTTP; Tue, 24 Feb 2015 01:35:03 -0800 (PST)
Date: Tue, 24 Feb 2015 15:05:03 +0530
Message-ID: <CADMH9KBinadwV00-kok4d4qQWLxFgmss0Auw8xKJh3u+H5uorQ@mail.gmail.com>
From: Aravind Babu <aravind.nizam79@gmail.com>
To: meta-ti@yoctoproject.org
Subject: How to build Local PC kernel using Local Pc Toolchain with Yocto
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
X-List-Received-Date: Tue, 24 Feb 2015 09:35:06 -0000
Content-Type: multipart/alternative; boundary=001a113de272c08b69050fd23ba4

--001a113de272c08b69050fd23ba4
Content-Type: text/plain; charset=UTF-8

Hi ,

I am new to Yocto build system & I am currently using Ycto (Poky
distrbution) in my project to build u-boot, kernel and file system.

I am working on *AM437x GP EVM board*. and I am using
*ti-sdk-am437x-evm-07.01.00.00*

I am able to build kernel and file system using Yocto but these are
different versions which I don't want to build,  and there are building
based on versions  specified in .bb files.

but I want to use my local PC *Tool chain* and my local PC* Kernel-3.12 *in
Yocto build but with my local tool chain path and local PC kernel I am not
able to build

can you please provide the procedure to export local Toolchain path & build
the local Pc kernel3.12

Thanks
Aravind

--001a113de272c08b69050fd23ba4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi ,</div><div><br></div><div>I am new to Yocto build=
 system &amp;=C2=A0I am currently using Ycto (Poky distrbution) in my proje=
ct to build u-boot, kernel and file system.</div><div><br></div><div>I am w=
orking on <strong>AM437x GP EVM board</strong>. and I am using <strong>ti-s=
dk-am437x-evm-07.01.00.00</strong>=C2=A0=C2=A0</div><div><br></div><div>I a=
m able to build kernel and file system using Yocto but these are different =
versions which I don&#39;t want to build,=C2=A0 and there are building base=
d on versions=C2=A0=C2=A0specified in .bb files.</div><div><br></div><div>b=
ut I want to use my local PC <strong>Tool chain</strong> and my local PC<st=
rong> Kernel-3.12 </strong>in Yocto build=C2=A0but with my local tool chain=
 path and local PC kernel I am not able to build </div><div><br></div><div>=
can you please provide the procedure to export local Toolchain path &amp; b=
uild the local Pc kernel3.12</div><div><br></div><div>Thanks </div><div>Ara=
vind<br></div></div>

--001a113de272c08b69050fd23ba4--
