Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D942BCD3436
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 13:31:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14697.1777901512319955525
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 06:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y2c8XccC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so39472635e9.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777901511; x=1778506311; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2IQ21Osq1C3+2TlnIDBkoH4/ZRu2AK32Iy5Wz8k0UcA=;
        b=Y2c8XccCGTMvjm8FKh8W5JyiqHK2pY2Jd0KOqUmu3OQjKFdcoswmvzCTKzST/Y3RB4
         3fqyJyb5uyrR4xTIW4VkKkoMYPeCUNr9zJIeKrExNlEuao34DFMHdOP9AJXIe4cyagex
         Hd4U6GYv+ZXOwg45R30Vr3tFd5/uW/kBQDtBRcNJHQ/NHj1CyHC4DlIapFbu/3LO0Qsg
         IqNJQxzpeDM87i9HehlMnsoOHMTZxz+4vNQnYFVqfLnr1lhvLnzjLVvNW/AY256+5p/V
         m7SMzDycR/9jBd7rf0VUe6tsFtBhAZWkJOsroaw0pt4cdtkAGJhgMiEbP28vD/nqma5p
         OE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901511; x=1778506311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IQ21Osq1C3+2TlnIDBkoH4/ZRu2AK32Iy5Wz8k0UcA=;
        b=TrqpIw+yhAJZL/kvZrKMiLJvXERPv6bL3CvXUGzA943H24ZPRieGFCOEhrSNUYLp7P
         iwoCg5Hu9Vrms7m6+iezCzwDJnt+RETvRj/Do8Lhf3Z4VC+3kHLIphtYmvqTQMB8kKEI
         Du41c5g/X2eBzFoqCAVKda99rrWB59l4wAIPjkndwcdel9m5L2G2aUVYc1ql8CQnLdaa
         U70WX7AB3ylEZOkANVmOkykxrMtE5Zz8/UrCe3lY1FVaqdTo3KIoXzEiQKHSRdRbrZDA
         BB/2pVbsh6Rp/0NgSujKZ2V82I6tiS6NpJ3FQczV0FjXuc7JCa6ZKUn2dH9NBbkCtH4D
         W22A==
X-Forwarded-Encrypted: i=1; AFNElJ/yLT1XVfPv6ZXt02vMF7j/r9kUYiEODGs1Og0puzzB4mFEgQVNIi6Uj1KhqEA3srTbqJsuUL1y@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz73BWxG0Ue0ZIe+nzj7b8ersKZRzJyB8DMOWUCa/tvtLYD1RzN
	YWB9SHIhvrWLoJ6JU4Tw5yC78d6jNSdPpwfqmNEQ1zMIrXDePqZ1LUUS
X-Gm-Gg: AeBDiesVxuHrDTz/+CeB0IOyz/3FugC8dzuusbWbna3c0ph43ZixkaGJgQiQGXyEMzG
	kt9c+Rx27OxMBhtmXaYvSHO6oI5i75NufpSR/GGuyEOlSM55LOYodRTqZ+RLBHtPQcWBNi4JRwM
	CmloQuN3+skIjBPXeh4vEDqOD+qzhpeVxOuaL+a+MAt9+BHMINR5UqJF5XpTEOofnvGbp1pVjr1
	sOn9Kb1943cW3iMH5w6v3vuVcGdV21aNlXai/opplD5oMi8Z6fUyxzDcN4Ul4c5KOlS5bTV2H2c
	stoEJ5cCCB2KXm50rG0mWqZO7Noi20mTrkOegzGiN8mitDzImP8vZyErHqfGZyxeuh3jz/hZHf6
	17/zi8UXvP6Y7MMOlGJmsyF3O31k1p14bEb6JBNkPUlaEy5O4H6Iypq6Mh+Bh3EXNlE1khpT0RB
	6o4cVBw2whgHq7f9g25mdVxtbdFbboOhcFVIIQ5qL85BETgh+DDwLXBp6AnAh2fKHdKkBXC5+I8
	3C/ZX4Ndhu3c2eOFaqyiFoqE2ALuXtEZ5gvEMGg0czP1BSoD4vxv6WVjbQLLJITh9/4hUr0TADr
	MXuCwM/6
X-Received: by 2002:a05:600c:8903:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48a98663f36mr130500575e9.22.1777901510458;
        Mon, 04 May 2026 06:31:50 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm326750765e9.1.2026.05.04.06.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:31:49 -0700 (PDT)
Date: Mon, 4 May 2026 15:31:49 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
	Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>, 
	Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
Message-ID: <isdbhg5mqp6mp7spjriuvofce7rx27kfeqilqkfisy5hbhukbf@7i3eozlyn3uu>
References: <20260324162004.3215160-1-reatmon@ti.com>
 <20260324164438.GU11121@denix.org>
 <88c431e4-862d-48eb-b2ab-d2502596bf9f@ti.com>
 <20260324184327.GX11121@denix.org>
 <wawx3v6oo27qezvbdiaq4gmuytwquwlxxev7kjtqni3mtxol7b@rgr2c6nppzdq>
 <79079a96-8421-448c-b297-42012e3b4163@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79079a96-8421-448c-b297-42012e3b4163@ti.com>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 13:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19922

On Wed, Apr 22, 2026 at 08:40:31AM -0500, Ryan Eatmon wrote:
> > 
> > Hi Ryan,
> > Hi Denys,
> > 
> > We have our own weston_9.0.0.bb recipe in a layer that is used alongside
> > meta-ti. Because of this rename, the bbappend from meta-ti started to
> > apply onto this recipe as well, and of course the patch is not
> > compatible with that version of weston.
> > 
> > Probably we should not be keeping such an old version around, but while
> > I initially also thought that it is just a choice of which error, this
> > situation shows that there is a real reason to keep the bbappend version
> > specific. It's not just about getting an error during parsing vs during
> > patching (which personally I do prefer) but also about not applying to
> > the wrong version where the patch might be irrelevant. Please let me
> > know if I misunderstood the situation here.
> 
> You are spot on.  And this is a good reason to keep the bbappend version
> specific.  I'll send a patch to fix this.

Hi Ryan,

Only a gentle ping on this. Otherwise, we could also send a patch for 
this.

Thanks 

Franz

