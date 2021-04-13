Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.7735.1618314084931408429
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 04:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=f497VV5w;
 spf=none, err=permanent DNS error (domain: falconsigh.net, ip: 64.147.123.25, mailfrom: zan@falconsigh.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 33EE412EE
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Apr 2021 07:41:22 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute2.internal (MEProxy); Tue, 13 Apr 2021 07:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1yiy5V
	Wu82M7o9+pdFZB6coF4eQt997uveFEUVCCDbI=; b=f497VV5wrjj15oFmOdWawb
	8ETDXaE/IV4F3fCVvABdXEt0uBPww9rTeh9eCrKUmQpt9lfFtZwR1vDvj0ZTguxK
	S2PQxPB/9CPapkBGjpZkvacZK7ZPiYPA5nmcnecGvoDb94aKMkLannpBtulYsxmM
	42hHY8uOwzjKdezJ8J68FbHvsdgUC2Dc+J3Nm4TfxATE4axxbbdImBkxN6bsZwhc
	35fqPzJh3hv07dUgS0pbVA/XCR/8VnEJXQpjwGbCW6GN8+M0iHi/mNjDMD+QaR7K
	uQf7+nP4bLHB4qX7SU/a6phrlzoDg/zEjIoWpPQcOTb1LdtHMNp9eXVwbXWbm5Ow
	==
X-ME-Sender: <xms:YYN1YJDVrGJZ0vzVem2C9AW0UKF6ZiPfVBnfK0HCBAMorOoWixT8UA>
    <xme:YYN1YHhqLFSh2E3rI4gYz5Pa0USKazVdbx0iy2h2kRahWsuidrknVdqJotePKRHx8
    8LufDIhpVF_05y4rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
    erreerreejnecuhfhrohhmpeiirghnsehfrghltghonhhsihhghhdrnhgvthenucggtffr
    rghtthgvrhhnpeetjeevtdfgleeugfetjeelieeiudeihffgtdekledvgefftddvuddvgf
    ejvedvieenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiigrnhesfhgrlhgtoh
    hnshhighhhrdhnvght
X-ME-Proxy: <xmx:YYN1YEl9kezXaaoaryVpTQe7OKF9CUJgwJTneahLwscdadTGncR70w>
    <xmx:YYN1YDxasYLuYnG75hso8p5VKSNQleaTF-XJwNU3lVsl8jB3R38ucw>
    <xmx:YYN1YOQXKXDjdStXOIHd9g9FP4SmMnv8jjTAmMRoAdv9EAcwmGN-uQ>
    <xmx:YYN1YMDsv-8GleldBcC-4NGBaZ8Z3P9PIL1_2tQY1UM9QiPVpZ3FAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 40EC416005E; Tue, 13 Apr 2021 07:41:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <f6c786e1-363f-499d-b19e-9e1647161644@www.fastmail.com>
In-Reply-To: <16673A9B03286F37.14505@lists.yoctoproject.org>
References: <20210224082509.14163-1-zan@falconsigh.net>
 <3c3a7b165e474569a0ce474f2c5e7635@ti.com> <20210224202307.GB4892@denix.org>
 <16673A9B03286F37.14505@lists.yoctoproject.org>
Date: Tue, 13 Apr 2021 13:41:00 +0200
From: "Zan Dobersek" <zan@falconsigh.net>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Content-Type: multipart/alternative;
 boundary=ce61fc1db230487a98061872ecc8b869

--ce61fc1db230487a98061872ecc8b869
Content-Type: text/plain

Hi,

this patch is still valid and needed for Poky-based builds. Did it just go unattended or is there some action still expected on my part?

Regards,
Zan

On Fri, Feb 26, 2021, at 8:10 AM, Zan Dobersek wrote:
> On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytriyenko wrote:
> > On Wed, Feb 24, 2021 at 06:57:57PM +0000, Gowtham Tammana via 
> > lists.yoctoproject.org wrote:
> > > 
> > > 
> > > >-----Original Message-----
> > > >From: meta-ti@lists.yoctoproject.org <mailto:meta-ti%40lists.yoctoproject.org> <meta-ti@lists.yoctoproject.org <mailto:meta-ti%40lists.yoctoproject.org>> On
> > > >Behalf Of Zan Dobersek
> > > >Sent: Wednesday, February 24, 2021 2:25 AM
> > > >To: meta-ti@lists.yoctoproject.org <mailto:meta-ti%40lists.yoctoproject.org>
> > > >Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-
> > > >poky-linux-gnueabi compiler prefix
> > > >
> > > >The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi
> > > >prefix
> > > >to the arm-linux-gnueabihf preferred target. Same should be done for the
> > > >arm-poky-linux-gnueabi prefix.
> > > 
> > > This looks ok. Btw what layer is being used when using this toolchain.
> > 
> > Gowtham,
> > 
> > This toolchain is built by Poky, which is the reference distribution of the 
> > Yocto Project.
> > 
> 
> That's right.
> 
> FWIW the patch should be applicable to both dunfell and master branches.
> 
> Regards,
> Zan
> 
> > -- 
> > Denys
> > 
> > 
> > > >Signed-off-by: Zan Dobersek <zan@falconsigh.net <mailto:zan%40falconsigh.net>>
> > > >---
> > > > ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > >diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-
> > > >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-
> > > >gnueabi.patch
> > > >index 071ce0ca..15105eac 100644
> > > >--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > > >+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > > >@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
> > > >    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> > > >     $(1)_compiler_preferred_target := aarch64-linux-gnu
> > > >    endif
> > > >-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
> > > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > > >++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-
> > > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > > > +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> > > > +  endif
> > > >    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-
> > > >redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > > >--
> > > >2.30.0
> >
> 
> 
> 
> 
> 

--ce61fc1db230487a98061872ecc8b869
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.MsoNor=
mal,p.MsoNoSpacing{margin:0}</style></head><body><div style=3D"font-family:=
Arial;">Hi,<br></div><div style=3D"font-family:Arial;"><br></div><div style=
=
=3D"font-family:Arial;">this patch is still valid and needed for Poky-base=
d builds. Did it just go unattended or is there some action still expected =
on my part?<br></div><div style=3D"font-family:Arial;"><br></div><div style=
=
=3D"font-family:Arial;">Regards,<br></div><div style=3D"font-family:Arial;=
">Zan<br></div><div style=3D"font-family:Arial;"><br></div><div>On Fri, Feb=
 26, 2021, at 8:10 AM, Zan Dobersek wrote:<br></div><blockquote type=3D"cit=
e" id=3D"qt" style=3D""><div>On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytri=
yenko wrote:<br></div><div>&gt; On Wed, Feb 24, 2021 at 06:57:57PM +0000, G=
owtham Tammana via&nbsp;<br></div><div>&gt; lists.yoctoproject.org wrote:<b=
r></div><div>&gt; &gt;&nbsp;<br></div><div>&gt; &gt;&nbsp;<br></div><div>&g=
t; &gt; &gt;-----Original Message-----<br></div><div>&gt; &gt; &gt;From:&nb=
sp;<a href=3D"mailto:meta-ti%40lists.yoctoproject.org">meta-ti@lists.yoctop=
roject.org</a> &lt;<a href=3D"mailto:meta-ti%40lists.yoctoproject.org">meta=
-ti@lists.yoctoproject.org</a>&gt; On<br></div><div>&gt; &gt; &gt;Behalf Of=
 Zan Dobersek<br></div><div>&gt; &gt; &gt;Sent: Wednesday, February 24, 202=
1 2:25 AM<br></div><div>&gt; &gt; &gt;To:&nbsp;<a href=3D"mailto:meta-ti%40=
lists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a><br></div><div>&g=
t; &gt; &gt;Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly h=
andle arm-<br></div><div>&gt; &gt; &gt;poky-linux-gnueabi compiler prefix<b=
r></div><div>&gt; &gt; &gt;<br></div><div>&gt; &gt; &gt;The additional patc=
h for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi<br></div><div>&gt; &gt;=
 &gt;prefix<br></div><div>&gt; &gt; &gt;to the arm-linux-gnueabihf preferre=
d target. Same should be done for the<br></div><div>&gt; &gt; &gt;arm-poky-=
linux-gnueabi prefix.<br></div><div>&gt; &gt;&nbsp;<br></div><div>&gt; &gt;=
 This looks ok. Btw what layer is being used when using this toolchain.<br>=
</div><div>&gt;&nbsp;<br></div><div>&gt; Gowtham,<br></div><div>&gt;&nbsp;<=
br></div><div>&gt; This toolchain is built by Poky, which is the reference =
distribution of the&nbsp;<br></div><div>&gt; Yocto Project.<br></div><div>&=
gt;&nbsp;<br></div><div><br></div><div>That's right.<br></div><div><br></di=
v><div>FWIW the patch should be applicable to both dunfell and master branc=
hes.<br></div><div><br></div><div>Regards,<br></div><div>Zan<br></div><div>=
<br></div><div>&gt; --&nbsp;<br></div><div>&gt; Denys<br></div><div>&gt;&nb=
sp;<br></div><div>&gt;&nbsp;<br></div><div>&gt; &gt; &gt;Signed-off-by: Zan=
 Dobersek &lt;<a href=3D"mailto:zan%40falconsigh.net">zan@falconsigh.net</a=
>&gt;<br></div><div>&gt; &gt; &gt;---<br></div><div>&gt; &gt; &gt; ...1-km-=
support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-<br></div><di=
v>&gt; &gt; &gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br></div><di=
v>&gt; &gt; &gt;<br></div><div>&gt; &gt; &gt;diff --git a/recipes-bsp/power=
vr-drivers/ti-sgx-ddk-km/0001-km-support-<br></div><div>&gt; &gt; &gt;OpenE=
mbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-<br></div>=
<div>&gt; &gt; &gt;drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardf=
p-toolchain-w-o-<br></div><div>&gt; &gt; &gt;gnueabi.patch<br></div><div>&g=
t; &gt; &gt;index 071ce0ca..15105eac 100644<br></div><div>&gt; &gt; &gt;---=
 a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-<br></div><div=
>&gt; &gt; &gt;OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch<br></div><di=
v>&gt; &gt; &gt;+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-sup=
port-<br></div><div>&gt; &gt; &gt;OpenEmbedded-hardfp-toolchain-w-o-gnueabi=
.patch<br></div><div>&gt; &gt; &gt;@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e=
 100644<br></div><div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; ifneq ($$(filter aar=
ch64-%,$$($(1)_compiler_preferred_target)),)<br></div><div>&gt; &gt; &gt;&n=
bsp;&nbsp;&nbsp;&nbsp; $(1)_compiler_preferred_target :=3D aarch64-linux-gn=
u<br></div><div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; endif<br></div><div>&gt; &=
gt; &gt;-+&nbsp; ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-<br></div><d=
iv>&gt; &gt; &gt;gnueabi,$$($(1)_compiler_preferred_target)),)<br></div><di=
v>&gt; &gt; &gt;++&nbsp; ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnue=
abi arm-poky-linux-<br></div><div>&gt; &gt; &gt;gnueabi,$$($(1)_compiler_pr=
eferred_target)),)<br></div><div>&gt; &gt; &gt; +&nbsp;&nbsp; $(1)_compiler=
_preferred_target :=3D arm-linux-gnueabihf<br></div><div>&gt; &gt; &gt; +&n=
bsp; endif<br></div><div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; ifneq ($$(filter =
arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-<br></div><div>&gt; &gt; &g=
t;redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)<br></div><div>=
&gt; &gt; &gt;--<br></div><div>&gt; &gt; &gt;2.30.0<br></div><div>&gt;<br><=
/div><div><br></div><div><br></div><div><br></div><div><br></div><div><br><=
/div></blockquote><div style=3D"font-family:Arial;"><br></div></body></html=
>

--ce61fc1db230487a98061872ecc8b869--
