Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CF46E00D17; Fri, 15 Dec 2017 16:09:34 -0800 (PST)
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
	*      [209.85.214.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0D7DE00B48
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 16:09:32 -0800 (PST)
Received: by mail-it0-f65.google.com with SMTP id t1so22457180ite.5
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wS2EqSEETueDPA29jWOZZDDYezqV72oubizEtTR642A=;
	b=vXpJAnW/fKjvHhiXjj+dMSe7Dr0D2wJx2Uex8Q31Q1eUunvCOER6ntmbb1wAcNy7XR
	ZrdVXFim/4VZDY6sJ3rY6BxlWUVUaGmiOBAhxjORptkdJhZebhOzYMdOxFCejfYTwQOx
	sc/p/GV7eXs6cFSuuWPQloLUr6IkXWOOAuT6K5KtjLh+h4QHDbL4zBgpeSXdKcHHzZcZ
	stq9M1ErQRvUfP/3Idzakwn5DP8v/6k+njGRmDJK4G9AoIXxlrr5In8sr6g/yGaQQT5P
	qGe5UpanjtBwoTlbn9k/h207D6Ga7NpnlNsfQqTSZeoULoNNIHfzz2KTF0EVxTELkgnh
	WFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wS2EqSEETueDPA29jWOZZDDYezqV72oubizEtTR642A=;
	b=d05cPYk+fW/UVQCneBiXBC3eFV9FclJy8EQT1/5HIy6m44g52hYpwSVlk8RqStveTK
	cK9ANLxTk9kKU+WmaNpUvfKB9OUs15GPyyHKrSWUGtxa1ojNizbIRIBNxxEgWEkFosb8
	NFteD5Sc4kN8yao6pMvPhPr1ICKto5Fpdat9QAMzWxJwFR/3Gx97doIUih6KfdcjCr3X
	YmQEFYfuXfk7Dxc68eqvybt07JgUpamDDKlrKNb+ma9GNbVZAlsCh8ZLZzaMvpcLC2rF
	j8yB6hW8qZVFUI/757Xg4SgPhJK5i+pJrhhhxf7GEyYKP4YhZt8eV3CE8802OrVLpYKW
	BHdQ==
X-Gm-Message-State: AKGB3mIS61EK8GlbqC1Z8vylSOLlF+/s26smFLboL/RVbG5KvNZNkrCi
	HrloEkahw5MlKggUUv7AFPI=
X-Google-Smtp-Source: ACJfBovS9ob89PyefMxodFKsGXIM/Xf8X79vSCYEdZPhkdF/ZCpHvKFLL4m5uvEMftB1PNQhTVuAbA==
X-Received: by 10.36.57.1 with SMTP id l1mr10855114ita.2.1513382972078;
	Fri, 15 Dec 2017 16:09:32 -0800 (PST)
Received: from farscape ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.googlemail.com with ESMTPSA id
	r95sm2551669ioi.74.2017.12.15.16.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Dec 2017 16:09:31 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513382968.25932.5.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 15 Dec 2017 18:09:28 -0600
In-Reply-To: <20171215225945.GD361@edge>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
	<20171211222857.17997-1-JPEWhacker@gmail.com>
	<20171211223916.GB27197@edge>
	<1513039988.18435.4.camel@gmail.com> <20171215225945.GD361@edge>
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
X-List-Received-Date: Sat, 16 Dec 2017 00:09:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-12-15 at 17:59 -0500, Denys Dmytriyenko wrote:
> On Mon, Dec 11, 2017 at 06:53:08PM -0600, Joshua Watt wrote:
> > On Mon, 2017-12-11 at 17:39 -0500, Denys Dmytriyenko wrote:
> > > Thanks! Can you please detail the changes between v1 and v2 of
> > > the
> > > patch? We 
> > > are still investigating v1 of the patch and how it affects our
> > > releases...
> > 
> > Sorry, just rebased and took the opertunity to add the branch
> > specifier
> > (morty) to the patch subject since I forgot it the first time.
> > There
> > are no functional changes.
> 
> Thanks, have you tried building anything with this change?
> 
> Right off the bat it breaks ipumm-fw, as it expects xdctools to
> reside in the 
> same sysroot as BIOS, which is the target one. Fixing it.

Hmm... thats odd. I'm though we were building the ipumm-fw recipe...
maybe not though. We are a ways behind on the morty branch right now
(which is where our patch was based originally). I'll make sure to get
us up to the HEAD and try it on Monday.

> 
> Also, I'm making corresponding changes in meta-arago, which uses
> xdctools as 
> well. Hopefully there's not much breakage there...
> 

We don't use much of meta-arago (our distro is poky based), but we do
"cherry-pick" most of the non-qt based recipes through a rather ugly
process from meta-arago-extra (I don't know if they all build though).
On a side note, optional Qt support in meta-arago would be *greatly*
appreciated :)

Thanks,
Joshua Watt

