Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18190E00D6E; Mon, 18 Dec 2017 10:50:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EBB9E00CFF
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 10:50:10 -0800 (PST)
Received: by mail-ot0-f196.google.com with SMTP id p31so7604300ota.4
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 10:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v/ZHMYJC6R2yCa5abinweSehxrbTpXiQBxSDS0SICGU=;
	b=jGx5+f+fF+zKWsvBkAwzrDweqOv+ePEXgldxYbR7Ot5LXXAXEKH7VrZFxKIDC2XQb9
	A2Kp1OiP/tng49VRgS4b2MgZjrhJbSIZLY7oqUhxV9TN0YwibF8Wzm8V7H4Bt8IkNyeU
	tpGPoVQ4gsjzP0LRpR2cKb01GOcleEb1Nsy3Nb19rPBpPLcgMgx8Jz6EFyygb7myaXVs
	VykeC+h+f35o9rSx9NAzaJmAj+0Sqrq7OG9i5aRQY88eypZdzOB5Y20/IAFl8KiYUFLq
	zn/gQj/zXxuuQPz5+foGU/igLEu4GsM6zbGoyHuDsy6/hLCjHoz79M/rvBcEwAKKSyld
	Yfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v/ZHMYJC6R2yCa5abinweSehxrbTpXiQBxSDS0SICGU=;
	b=Kw1ydyGqLzLjKBoyAFI3z13Y+j1gbu+RpSqvEzZuDiOHy2QtetBVJOqpTv+D8lHH+k
	hOxyuudyJtLnAkn+kd1pXFApefZ4mkYG4EvgmjYawLO35hNbxvWcStl16GQxSvap2Pub
	6B6hM71iUu66hYA6wywUxVE+CMzkeEKeXgIj5mvZp01jSHsoBSU+Ccmcb5MjucWsbMPs
	EcG8xC/aBKNNVOiJ0Ux/XxO6xs8eByLxQrGjHPN+A5gBUlzN75Jw38FPTl5SIyFAO1RN
	X3KWI1uU3pljGUD/SuTNqriZvyBPKd942941PE8z2dcR/Tz6Phjx0cLBLar7AlI9eqwT
	xnBw==
X-Gm-Message-State: AKGB3mJh+xBn3Y70aurcguFMDKdSQVj7w0MwEz3ri83mTg0SyqV8A7Ts
	1J92Eu817bGmZJGcRNqYsHY=
X-Google-Smtp-Source: ACJfBovCN1ZPZgkPKwk1A6OuYpOMrjewhMq9DS/xEzxP2DGP8MAZde6CmIlqsxaACZ9T8h3CezdnFQ==
X-Received: by 10.157.39.134 with SMTP id c6mr438814otb.259.1513623009475;
	Mon, 18 Dec 2017 10:50:09 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	d68sm6114885oic.57.2017.12.18.10.50.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 10:50:09 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513623007.6502.20.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 18 Dec 2017 12:50:07 -0600
In-Reply-To: <20171218180814.GC4033@edge>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
	<20171211222857.17997-1-JPEWhacker@gmail.com>
	<20171211223916.GB27197@edge>
	<1513039988.18435.4.camel@gmail.com> <20171215225945.GD361@edge>
	<1513382968.25932.5.camel@gmail.com> <20171218180814.GC4033@edge>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org, "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: Re: [morty][PATCH v2] Make ti-xdctools a native recipe
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
X-List-Received-Date: Mon, 18 Dec 2017 18:50:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-12-18 at 13:08 -0500, Denys Dmytriyenko wrote:
> On Fri, Dec 15, 2017 at 06:09:28PM -0600, Joshua Watt wrote:
> > On Fri, 2017-12-15 at 17:59 -0500, Denys Dmytriyenko wrote:
> > > Thanks, have you tried building anything with this change?
> > > 
> > > Right off the bat it breaks ipumm-fw, as it expects xdctools to
> > > reside in the 
> > > same sysroot as BIOS, which is the target one. Fixing it.
> > 
> > Hmm... thats odd. I'm though we were building the ipumm-fw
> > recipe...
> > maybe not though. We are a ways behind on the morty branch right
> > now
> > (which is where our patch was based originally). I'll make sure to
> > get
> > us up to the HEAD and try it on Monday.
> > 
> > > Also, I'm making corresponding changes in meta-arago, which uses
> > > xdctools as 
> > > well. Hopefully there's not much breakage there...
> > 
> > We don't use much of meta-arago (our distro is poky based), but we
> > do
> > "cherry-pick" most of the non-qt based recipes through a rather
> > ugly
> > process from meta-arago-extra (I don't know if they all build
> > though).
> 
> Latest patches for meta-ti and meta-arago were posted to resolve
> discussed 
> above issues.

Thanks, we'll give it a try

> 
> 
> > On a side note, optional Qt support in meta-arago would be
> > *greatly*
> > appreciated :)
> 
> Can you be more specific? Do you have an exact components from meta-
> arago 
> that you want to build w/o Qt?
> 
> On the other hand, we only officially support Wayland on our
> platforms, not 
> X11. Thus there are some specific graphics requirements involved - if
> you are 
> trying to build something graphical, it will pull in Qt
> dependencies...

We are running Wayland (although it is our own custom compositor), so
thats not really the issue. I don't think we have any expectations to
be able to *build* recipes that depends on Qt. The problem we run into
is that we can't include meta-arago at all because it depends on
classes and such from meta-qt, which we aren't including. This prevents
the recipes from even parsing. This isn't a problem unique to meta-
arago, but meta-arago is the first one that have had to work around in
such an annoying fashion.

I think the main offender is qmake5.bbclass, but there might be others.
I don't really know of a good way to make these recipes parse when Qt
isn't present... the best I can think of off the top of my head would
be something like:

 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'qt5', 'qmake5', '')}

I guess the other option would be to move stuff to meta-ti from meta-
arago? I don't know what qualifies something to be in one or the other.

I'm more than willing to put some patches together if you have any
thoughts.

Thanks,
Joshua Watt


