Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37982C83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:35:50 +0000 (UTC)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by mx.groups.io with SMTP id smtpd.web10.5461.1752611715713528254
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 13:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M3c91kzE;
 spf=pass (domain: bootlin.com, ip: 217.70.178.249, mailfrom: thomas.petazzoni@bootlin.com)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 3547058968A
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 20:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C12C04434C;
	Tue, 15 Jul 2025 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752610383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMvURgKNfEcgL37mWbfHJHzqWKTOslmFFZXpkYEPvpQ=;
	b=M3c91kzEn14xR3jukOBETo2uDSD1em/SzFFSb8a0iriVqUKzMtmIUq5E46oBXtxreRP0G6
	xY5GQ/H0iMhZQ8iaa5ranOyljtm3eeDOPfaqzN+iBtW/SI3RdhTb7irXIdPCAm/WTNY36Y
	wEHQovOkIjxsU3FPl9JnCZuDNZ9EdpwgnBjPK1rtdd6eS9zCsok/mgoVwR2U6AstH+Y5kX
	/it6cN+agv1SGpGExzDZEyckSGxnUteaXNwN5CwZgCBtLUL4uLJe62cmBNR+VY5pUmeMy3
	iDiQbeBUsHjgUvjn2i/38IIlm7gQsk+21xsbv7vZDkiQGPAwis2IdxjpIZM+Cg==
Date: Tue, 15 Jul 2025 22:12:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Miguel Gazquez <miguel.gazquez@bootlin.com>,
 <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
 <romain.gantois@bootlin.com>, <kory.maincent@bootlin.com>,
 <thomas.bonnefille@bootlin.com>, <denys@konsulko.com>,
 <robertcnelson@gmail.com>
Subject: Re: [PATCH 1/2] conf: machine: add BeagleBone Green Eco to KERNEL_DEVICETREE
Message-ID: <20250715221258.0f97521c@windsurf>
In-Reply-To: <40c291ff-c3ee-4d9f-a45a-3affb088cf7e@ti.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
	<20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
	<40c291ff-c3ee-4d9f-a45a-3affb088cf7e@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehheejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtieemkedtgehfmeefiedvleemieehvgeimegsudelvdemfeeksgelmegssggskeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstdeimeektdegfhemfeeivdelmeeihegvieemsgduledvmeefkegsleemsggssgekpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhgvrghtmhhonhesthhirdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhgrgiiqhhuvgiisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgvthgrqdhti
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghnhihssehkohhnshhulhhkohdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 20:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18790

Hello Ryan,

Thanks for your review!

On Tue, 15 Jul 2025 08:52:03 -0500
Ryan Eatmon <reatmon@ti.com> wrote:

> NAK.  As has been mentioned several times on this list, we do not update 
> KERNEL_DEVICETREE directly.  As we support multiple kernel versions with 
> each branch, we cannot have a single KERNEL_DEVICETREE that works for 
> all kernel versions.
> 
> To that end we setup the KERNEL_DEVICETREE_PREFIX variable that will 
> pattern match and change the value for KERNEL_DEVICETREE based on the 
> available matching DTBs in the given kernel.  The only kernel version 
> that uses KERNEL_DEVICETREE is the mainline (aka latest stable) kernel. 
> And the value for this variable is automatically updated to include all 
> of the available DTBs in the mainline kernel at the time we update the 
> recipe to that version.
> 
> As the KERNEL_DEVICETREE_PREFIX already has an entry that will pick up 
> this new DTB when it is available, this change is not needed.
> 
> Right now this new DTB is only available on linux-next and has not made 
> it into any released kernels.

This DTB has also been backported into linux-ti, which is really what
we're interested in for now. Though probably that doesn't change
anything to your feedback, but I thought it was worth mentioning.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

