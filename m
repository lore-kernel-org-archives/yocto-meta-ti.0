Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A12DF9B60D
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:32:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78560.1776850641650205245
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 02:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dfI5LcX/;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4411e1eba51so1888325f8f.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776850640; x=1777455440; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1lKVVGVwyijlmQCU9+J6YHsGuDWgcivNClzHAte8+Q=;
        b=dfI5LcX/UU0LvRQZz0Y2GoYq/TR0Lqhvr+u+4TrnRh6d6pDS7XNi4calI9W0gzZUvk
         3NgQoszNhM7uvhx6TLOsLuJpSxLzIxIHi5LlfxjIi07NPPJAjQllGXKjv7Sh9SPPzw1q
         yzYBE/1XihaKK+6GdCrDK5+O1WWfMaywmOkpGiBi4hKl4GLGLYtbT92Z4I8OKOJtAT2E
         NFrEoDp+pbi/tZzvefzn0nggv2i7SZnVHjKUDQlqOdji0jgUQgbD7ODPlvw9S4BWFacR
         rkb7GIUGE1UiaB5YCgCQOSMCBzptIdc2qU2BamSmMx0OKLnOD5McRlJcmTbC99e142BJ
         fHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850640; x=1777455440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1lKVVGVwyijlmQCU9+J6YHsGuDWgcivNClzHAte8+Q=;
        b=B/rL7C/r4LrcQGLsFiF7Nx6pN6d0BVC+l6NAV45P9EpPa1S1VgieuJHYZWgeFvvVfv
         17M69y9Ba9qI4qy2GRZ3AgNtzkrkeHsjT5xqPfqGDo95/efH8FKYI2UZubHmOFeK0TlP
         FwFcqb0144CeXtpzVFbGifER7U8RObjhvZZQdcm4GCgkrc+3/1gz3pzWpMHxhlfTIPHW
         HYzNdnJZlPdh7GNdJ/mHGQX0WuJwwYX3AKZ/nIWbRBX3/2IDkbPtd+814y7SxvV7gB0n
         Jbp0ZLyTTgC7Fx91SkO4C2uqXjIaBmHOHzdYHnJufBFsh1UbMWZyAWD6SwRw98vqPHx2
         C8Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+P+eNitLuWZPZQ2eah3Dlefm04xh95LEXMZr+Fwc7C0rPWqTNUOholZvgoLQ/z+43Tb2g8s+XB@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy8zV2GN0JrSPFpdjtvwp3EJSK1NbONyZJattVwk0cLizYgODMc
	Uji7EQxZT+6yybs6l5O+qf7OEClUgWfjUs3Lyqxzkv0/LkbvnYS5IEwyWJdICRN7
X-Gm-Gg: AeBDietUK3s+d7gQLKipmbMYXUEd06v1aQzQIGbnS3yK7VgU3dpuiYGZNHK1kOlvIkj
	+mxg8trymEBuhGOWeHWEzaSYsKfArr6sygZMGZ6Jkk5ax0a3FAiwBgRwILy5P26PA4Gbz0eWoQL
	X5cIMU1eQd9R2AM0zQTbLxpU2GskjPF+sL+OGR6RbQuSH70axGJYp+catHgRhCqCXYWKNfY/ZHR
	6xy9+dTgTLDay10BeVoYmeSO6GBWvA2sRsdPUGk/43g60IseWu5oHENlwiyh8nuglKs3Lhet/VR
	V71OKfuAKc954UN8YPOuqZo2sfv5ORLD8DMXS6/1Ccyqa0PV/d8SKPj4C4T37NqxyQ6D/nDBG3D
	ZrzSinjPX8flwzlgeJvIUZ/DIqYNjwJ4mpPnTqBk5YRW9TktfPHQujUm6DjMSTR4oBvm4bMLM7L
	0TMzWI0r4vB4rrC1BUnWgQM11ERcb7WMeFWOVwxjtRr4/O2Xtsp/B6lp+sVV/M/8h1gmjQb87Ve
	FtxhxE9uulB4inbkOe9Vuk+JMjoioSARXbdlw==
X-Received: by 2002:a05:600c:8717:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a568faffemr82497945e9.8.1776850206647;
        Wed, 22 Apr 2026 02:30:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75c695sm131031325e9.14.2026.04.22.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:30:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:30:05 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, 
	Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
Message-ID: <wawx3v6oo27qezvbdiaq4gmuytwquwlxxev7kjtqni3mtxol7b@rgr2c6nppzdq>
References: <20260324162004.3215160-1-reatmon@ti.com>
 <20260324164438.GU11121@denix.org>
 <88c431e4-862d-48eb-b2ab-d2502596bf9f@ti.com>
 <20260324184327.GX11121@denix.org>
MIME-Version: 1.0
In-Reply-To: <20260324184327.GX11121@denix.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 10:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19865

On Tue, Mar 24, 2026 at 02:43:27PM -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2026 at 01:18:32PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> > 
> > 
> > On 3/24/2026 11:44 AM, Denys Dmytriyenko wrote:
> > >On Tue, Mar 24, 2026 at 11:20:04AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> > >>oe-core has bumped the version to 15.0.0 [1].
> > >
> > >
> > >>We need to adjust the bbappend version to % to better match future version
> > >>changes.
> > >
> > >You shouldn't be doing this rename.
> > >
> > >
> > >>Additionally, the patch needs to be updated to match the weston code
> > >>changes.
> > >
> > >The bbappend is version-specific on purpose exactly due to the fact that the
> > >patch won't apply against different versions - it has to be massaged every
> > >time there's a major version bump, we've done it many times before.
> > 
> > But... if the patch won't apply then the build will fail.  But it
> > fails in a manner that is more obvious then just an upfront error
> > about the bbappend not applying to a recipe.
> > 
> > Either way, with the new bbappend logic they put in, the build will
> > not go through.  So what does it really matter if the bbappend if
> > version specific or not?
> 
> Yes, the build will fail in both cases now.
> 
> I guess from my perspective, getting a patch failing to apply all of a sudden 
> is less clear indication that a major version update just happened upstream. 
> Versus an error message saying no recipe is available for this versioned 
> bbappend. Moreover, do_patch() error happens much further down the build 
> process, vs. a dangling bbappend error comes very early during parsing...
> 
> On the other hand, with your way, if the patch happens to apply cleanly to the 
> next major version, no intervention will be required.
> 
> So, pros and cons for both ways - I'll be fine with either...
> 

Hi Ryan,
Hi Denys,

We have our own weston_9.0.0.bb recipe in a layer that is used alongside
meta-ti. Because of this rename, the bbappend from meta-ti started to
apply onto this recipe as well, and of course the patch is not
compatible with that version of weston.

Probably we should not be keeping such an old version around, but while
I initially also thought that it is just a choice of which error, this
situation shows that there is a real reason to keep the bbappend version
specific. It's not just about getting an error during parsing vs during
patching (which personally I do prefer) but also about not applying to
the wrong version where the patch might be irrelevant. Please let me
know if I misunderstood the situation here.

Thanks and kind regards,
Ernest
 

