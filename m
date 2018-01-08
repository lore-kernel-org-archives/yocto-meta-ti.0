Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 214FDE00DCA; Mon,  8 Jan 2018 11:37:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAFDFE008FB
	for <meta-ti@yoctoproject.org>; Mon,  8 Jan 2018 11:37:00 -0800 (PST)
Received: by mail-it0-f65.google.com with SMTP id m11so10995926iti.1
	for <meta-ti@yoctoproject.org>; Mon, 08 Jan 2018 11:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BVeFbmGhw/6L4AmMnh0DPVlMSUbzKfKjSvyDXZl+d3I=;
	b=sS7IC9HAzZTQVpWN03oB/m5Rvr7CQ2pu0xz56+Dki+5DRzyVgvJIxhrTRx3az6Yurb
	vXrIgfmChF8ujOwmmgqpUhSaDoxbVXWbCj2JTQ85pIw9ShpTSe04EhgJ93hhCrni72dv
	GPKGh+R67cLSiVrMm8c/dWJ91g11mhQDjMTjtIfsnqof7M/KwlI/3Ux4iV1Yvt75ORP+
	KhetdI8mHvGyHUaKnefsBIyU3CuNthPhnjkU8UZXcJuIoPZ435h90iY3sBQSzAv9z/ck
	yFQBd6sY8hgWeI6WJ9YL6CQUjvwD2UJsXN6PavLIYqscsLlXAF2huWTLJ9luuIlA2TjD
	/L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BVeFbmGhw/6L4AmMnh0DPVlMSUbzKfKjSvyDXZl+d3I=;
	b=uhgZSrVOf+qS+7llzKyUk3JHLtoTz2vvFhYOe10K/xSY5zYGykXuwq5jF0LH4dyM+I
	YtONb1IjZ+NXpB/U6qbFy1CyLJNLjqyNckrNhKphUP6qe6gsPsl/OsFmRtBXb3T692xr
	f/GPdh+3y8o18+OepoWfAFbMZlNMetibAp/X2QzEmnKR4CTjbuWRK0jUdpnmsYOocM28
	11tq+2OLi0i26mDk/0B3HZYS00guIUitma/ZjyGfxyP3OUENP/8VXLjrfb1H0iwzMgO4
	vpFKH1hxumAIfny9x1mcvFgibsqMYAfPJcpCkzdhSmsjtyjh+Z2NoS7LM7oPY5M1CIZQ
	B/CA==
X-Gm-Message-State: AKGB3mKNoXtGSAr4p0sYbOu9JXwp9JMC2Rf+Ks8m3Og94OIG15XOjrLa
	M1szAgw8w25IoVTSPiN297A=
X-Google-Smtp-Source: ACJfBovzwKhWAuDV7oMFv8b1N1dm3okqRz8hhFlIQkht6rg1Ak28Z9AaaJVdtXMeuH9CmoYnoAX/GA==
X-Received: by 10.36.133.213 with SMTP id r204mr13422214itd.125.1515440220104; 
	Mon, 08 Jan 2018 11:37:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	131sm3061779iof.59.2018.01.08.11.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Jan 2018 11:36:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515440218.665.54.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 08 Jan 2018 13:36:58 -0600
In-Reply-To: <20180108192907.GP5984@edge>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
	<1513663292-22396-3-git-send-email-denis@denix.org>
	<1515177203.665.44.camel@gmail.com> <20180108192907.GP5984@edge>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 3/4] openmp-rtos: depend on doxygen-native for documentation
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
X-List-Received-Date: Mon, 08 Jan 2018 19:37:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-01-08 at 14:29 -0500, Denys Dmytriyenko wrote:
> On Fri, Jan 05, 2018 at 12:33:23PM -0600, Joshua Watt wrote:
> > On Tue, 2017-12-19 at 01:01 -0500, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-
> > > ti/openmp-rtos/openmp-rtos_git.bb
> > > index f5bf476..df082ea 100644
> > > --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > > +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > > @@ -19,7 +19,7 @@ SRCREV =
> > > "a2a518dcc9154a372b38bd5be8a483359123823c"
> > >  
> > >  LIC_FILES_CHKSUM =
> > > "file://docs/license/omp_manifest_template.html;md5=61a6972303c04
> > > 47b7
> > > c056195d7ebafee"
> > >  
> > > -DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios 
> > > ti-
> > > cgt6x-native libulm zip-native"
> > > +DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools
> > > ti-
> > > ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
> > >  DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
> > >  DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
> > >  DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
> > > -- 
> > > 2.7.4
> > > 
> > 
> > Can we backport this to morty please?
> 
> This change requires adding doxygen recipe to meta-ti, which is a new
> feature 
> and not a simple bugfix. It's probably too late for adding new stuff
> to morty. 
> 
> Do you have specific issues with the way it used to work in morty?
> Since there 
> weren't RSS or HOSTTOOLS restrictions in morty, host-wide doxygen
> install used 
> to work just fine then.

Ya makes sense... We have been carrying around a bbappend that did the
same thing as this patch, but we've always had a doxygen recipe in our
layer setup. I missed/forgot that doxygen *wasn't* in meta-ti (on
morty). We can just keep using the bbappend, sorry for the noise

> 

