Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web08.5921.1614323428552317771
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Feb 2021 23:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Xh5bvxP6;
 spf=none, err=permanent DNS error (domain: falconsigh.net, ip: 64.147.123.21, mailfrom: zan@falconsigh.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 54F90A55;
	Fri, 26 Feb 2021 02:10:27 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute2.internal (MEProxy); Fri, 26 Feb 2021 02:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hP6V/1
	3IfSmvH8fBJtr8/d92/yXBaU+GQR0vUtDLa7w=; b=Xh5bvxP6nmezyF8leLXo32
	/t7jC9zadE654QJh7XBy5fNpJAeEv/LGUNPGFTblUZYQDMfbNLd1Fi8qE5H5L5Bo
	m8An8eIeORoMByjWL2PMO3TZTPZVxk3f7TE8J4HWfrfaKb/OP0oXscnOctYMGTHf
	ErmOFRTxGoFbhiyX/70DryDPPeA9+N5YxdmVyNZmvMk44nY/xwoUBzec+Bs2qcc/
	QvsA5ly1n/6IIVk6qA+TjhumfhnZTGc0gkzKaWyJVLsuCui9XonBiaoqZkZxNnbs
	6mGMy41EtRPBBTqosc7sUiRarXTYmrBoRMdvtAYJ7sDXG0FMRC9INfxOXZy8MLuw
	==
X-ME-Sender: <xms:4p44YLnGK_H-0D_WbhYwkGoeuUFGiJc23Jzht7EX8D5EWPbwzyYk5g>
    <xme:4p44YO3ur-z5VDwFCOPJdQyZlYA2yNMNf3w74ssD6YYRzV6REv8TZPTp0W-lHn-ym
    SDsn3a8YoEiK6LKCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderreejnecuhfhrohhmpeiirghnsehfrghltghonhhsihhghhdrnhgvthenucggtffr
    rghtthgvrhhnpeekjefffffhhfejkeduiefhjeeivdfhfeejgeelhffggfeffeefjeeive
    evheeugeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiigrnhesfhgrlhgtoh
    hnshhighhhrdhnvght
X-ME-Proxy: <xmx:4p44YBoBbpcrMYpka6XXXdSB-_JO-GSCU-tbB7cVj6PIqdSjcY0NkQ>
    <xmx:4p44YDlAryMYE-Luc-FJN7u7AnF7kwHrjKyLAjW5-sYM_c491osMpQ>
    <xmx:4p44YJ1SIYQ4EykBGj_2_FesQ2Dfg0qdovGhQY6-rt1I_sMmySR5BA>
    <xmx:4p44YGgyGPORiQ6Gvne12inKc8FtBniNz7je3bV7rKw3mLZCvgNVDA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 630D3160084; Fri, 26 Feb 2021 02:10:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <8b4477ba-5e2a-4e53-bc83-339a75591463@www.fastmail.com>
In-Reply-To: <20210224202307.GB4892@denix.org>
References: <20210224082509.14163-1-zan@falconsigh.net>
 <3c3a7b165e474569a0ce474f2c5e7635@ti.com> <20210224202307.GB4892@denix.org>
Date: Fri, 26 Feb 2021 08:10:06 +0100
From: "Zan Dobersek" <zan@falconsigh.net>
To: "Denys Dmytriyenko" <denis@denix.org>, g-tammana@ti.com
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Content-Type: text/plain

On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 24, 2021 at 06:57:57PM +0000, Gowtham Tammana via 
> lists.yoctoproject.org wrote:
> > 
> > 
> > >-----Original Message-----
> > >From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On
> > >Behalf Of Zan Dobersek
> > >Sent: Wednesday, February 24, 2021 2:25 AM
> > >To: meta-ti@lists.yoctoproject.org
> > >Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-
> > >poky-linux-gnueabi compiler prefix
> > >
> > >The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi
> > >prefix
> > >to the arm-linux-gnueabihf preferred target. Same should be done for the
> > >arm-poky-linux-gnueabi prefix.
> > 
> > This looks ok. Btw what layer is being used when using this toolchain.
> 
> Gowtham,
> 
> This toolchain is built by Poky, which is the reference distribution of the 
> Yocto Project.
> 

That's right.

FWIW the patch should be applicable to both dunfell and master branches.

Regards,
Zan

> -- 
> Denys
> 
> 
> > >Signed-off-by: Zan Dobersek <zan@falconsigh.net>
> > >---
> > > ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-
> > >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-
> > >gnueabi.patch
> > >index 071ce0ca..15105eac 100644
> > >--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > >+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > >@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
> > >    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> > >     $(1)_compiler_preferred_target := aarch64-linux-gnu
> > >    endif
> > >-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
> > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > >++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-
> > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > > +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
> > > +  endif
> > >    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-
> > >redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > >--
> > >2.30.0
>
