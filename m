Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D5DAE00998; Sun, 29 Sep 2019 16:52:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74A83E00874
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 16:52:44 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id f7so14726472qtq.7
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H6fsES6JCQNPlMXqsGI7avQf4b9x1sWAtM0efPgz6aM=;
	b=dBsXB80dfRKpEMLkHj1LJjRO6TUmGmL3MfcbkokbqZ9x0vOSTc/nvrsolw+28drAXo
	Kr5dZr/ULbULyXz7MGIGiYQO3dydBAqC1+DN/wqDjTByIyVAcjPmdXqfTFM7z9lw2xGy
	Fzn/LYEPF8HqEHz+xeaCUOn0vtzd3Q6YdUIazk3bjfP8+Z3uXfm/CPp41yFOM51UzJl1
	LRnh4dXXdm1xajCO4/bLP0cTqOE/OUZOBM3j7xVIK3rmbNEJhIM1zKNBKZs9IoLNrI0m
	xrVudsRl7dYlpwrJyl+uOftG+YnzFeSWJivi2aHJWjQA9p0pf1X6mcx37ATaMqPmD0a7
	J5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H6fsES6JCQNPlMXqsGI7avQf4b9x1sWAtM0efPgz6aM=;
	b=Hh09P9EBAqW0u10s9+JTUfh/k0i7LkARMjzj8V8AfZy1RAKwN2568YLyUa6qPgW7+8
	6+n3Z66i6HstTxJRfPRMhrGYSIf4XsABZjd5kMIBD/hubVAgHoR83739V4omUI/hFTbs
	5DjUAhODapuMxmhbQ8PlS3gMQ1+p9VjShUgwBPzHRep0EW53Umim6R6ru1y/mDS++ZLO
	NYsDgx7w7f7lH/e9lu1OgjUb5/xFedRAQL+7Z2SiLPDSBf5ErgBgvaerpA4zSqjS+quC
	GrmAAnU9AgfGT/dPvHiz8vEMrawO6kUeMvWFwHBCjjmyPOa1LtW7CGUDU2VDk327vLDo
	lfig==
X-Gm-Message-State: APjAAAXmvv6mhu9ra5cho2Ox3Ko+5MSz98VO7AbmxkEQCkChPVkU7Ht/
	Cg5AgBZolLKOPD8aztxVQRSAYMw3kUiaRKIy8hM=
X-Google-Smtp-Source: APXvYqwgsdqoKO09n6qm87xY+s+LMscKGWaGiBUgLBIt1HhlgIhTpkKdhmC6aVDB5GAbxemDcEKio5mdHXGQfwmQz/0=
X-Received: by 2002:a05:6214:180a:: with SMTP id
	o10mr18283324qvw.51.1569801163361; 
	Sun, 29 Sep 2019 16:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190929154335.2646732-1-raj.khem@gmail.com>
	<20190929164040.GA10743@beryl>
In-Reply-To: <20190929164040.GA10743@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Sep 2019 16:52:14 -0700
Message-ID: <CAMKF1so4FBh4_52du4e1tSKTH03NqNwZ_7+U5oemxU4AtOQh3A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot-ti: Drop using COREBASE
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
X-List-Received-Date: Sun, 29 Sep 2019 23:52:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 29, 2019 at 9:40 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sun, Sep 29, 2019 at 08:43:33AM -0700, Khem Raj wrote:
> > COREBASE is hardcoding the path and moreover its obsolete the better way
> > is to use relative path which is automatically searched in BBPATH by
> > bitbake
>
> This was actually done on purpose - there are many versions of u-boot.bb and
> u-boot.inc in different OE layers:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=u-boot
>
> To avoid any conflicts, I specifically include the one from OE-Core.
>

hmm I guess not pretty but seems fine here. Lets drop this patch.

> COREBASE itself is not obsolete, just ${COREBASE}/LICENSE is:
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-COREBASE
> https://git.openembedded.org/openembedded-core/tree/meta/conf/layer.conf#n20
> https://git.openembedded.org/openembedded-core/tree/meta/classes/insane.bbclass#n468
>
> --
> Denys
>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> > index f1187e64..f7434712 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti.inc
> > +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> > @@ -13,7 +13,7 @@ UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> >  UBOOT_SUFFIX ?= "img"
> >  SPL_BINARY ?= "MLO"
> >
> > -require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> > +require recipes-bsp/u-boot/u-boot.inc
> >
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
> >
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

