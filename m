Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98A03E0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 11:37:00 -0700 (PDT)
Received: by bkcji17 with SMTP id ji17so2109719bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 05 Apr 2012 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XCo7T2qTcfF14Rma4xbVDXEnYreRLglV2mIT5CAZF20=;
	b=K+CsIQh2XzoR68FQ4UwfgFl08k4nlGbmxWJAkcRbIdRyrQGEAV1KdbdMj4iE/vVGfI
	FRNED1T1Y/iZ8WHahnwpb9Dtl9z/jrF1qelu8zeIIr1nQIl4P0IVr8DpyRnFauQXPwPA
	PYYj0QN99oPp6ib8KAdXOq1OsBYFOGntJ4Th/+nieS/zc1UjTKvDGEaIWcIMtQcJmEkG
	rQ3h9EW1wCG+YGN8/fGXNzZSbjid3XWJPjl0Q2sOr3RId/KnYSs3tpYp5eEedNvE8cvh
	ytoVIuZCPNJ2nXg3iT5clrh8GzDa67ApQC5ag9DklGT+js+6o70543Xm9PbLwyx+r2pV
	5pGQ==
MIME-Version: 1.0
Received: by 10.204.148.89 with SMTP id o25mr1651107bkv.52.1333651019512; Thu,
	05 Apr 2012 11:36:59 -0700 (PDT)
Received: by 10.204.149.195 with HTTP; Thu, 5 Apr 2012 11:36:59 -0700 (PDT)
In-Reply-To: <86pqbmm4oe.fsf@coulee.tdb.com>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
Date: Thu, 5 Apr 2012 14:36:59 -0400
Message-ID: <CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Russell Senior <russell@personaltelco.net>
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
X-List-Received-Date: Thu, 05 Apr 2012 18:37:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

I may be out of the loop but if you follow the yocto way of doing
things .... poky will produce a BeagleBoard image without having to
use meta-ti and I think you can use that on beaglebone.  Some one
correct me if I'm sending Russell in the weeds.

I've been able to build yocto images for BeagleBoard but haven't tried
them on the bone yet.

Last I checked meta-ti with poky still had some issues.

Regards,

Brian

