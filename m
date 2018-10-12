Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90407E00B92; Fri, 12 Oct 2018 13:34:41 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7BF0E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:34:40 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id 84-v6so8472822qkf.0
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DDS8cw5KYfAe3O0NIp75bY+Q6fEazw/oRDvzYQdytvo=;
	b=X1W5hcxe7U74DGahvPJzeIBzhILYSOUtr6yO8WWZ/Rekkqg3qvejpIMRNKzvENrBE7
	rpQn1oRS4Vwt+bJtOxF1NuJwz4m/+X/v9oFEOLj8TM+Mxy2nzChd1nUor5kGXp3SF2AJ
	nr0r7Ug+GiqQvL34A0ig4fnIIF0xUxgKDBeKPswo7EOzk7luC9c7xLAvvrYtpWxsIKsf
	UGJOcXk6n8IIE5Gire6G3PFnO+6y4nyLJ00nFUFcBmtMlqCKPXxoGwddCTIrVbyksaUS
	7XCeV7AnJyH0X4quDB5+Plp8I/UL1Xev5PguHznIFwavKNbx50R9Y6bm78qAP4nIf0Jb
	GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DDS8cw5KYfAe3O0NIp75bY+Q6fEazw/oRDvzYQdytvo=;
	b=d2bGP9uocFrKt7HHUFCsBM90xc6bZmuRkbBSr7nZMKMPZj/xkRD4nUNAG/iQOEaqHS
	UM5G/ROQmE8UAzma5F/9rWM6DWNvTmQrgFUilglRto2RS7iRpo03DcDExisweFkxAHy7
	duXff7YHkSHd0CNJ5fz1SiYb3EOV2MhfcwBIgi8y9UDZu1vXyG6unPIrm0zZ7Qi8SLt5
	I9VaFsV0DdCNZ4AMHQmMXAvCcrpo2nGTvB2aewYAbGAVR/NkmqMmjRLNpPMRGxgMT6bj
	SLfBXf1XKhqItOVa606JviyHHZf72fpmWQwMfFq8Lqzv5Sw1qIFDTtWggsNH1rD4zv2Q
	tO1A==
X-Gm-Message-State: ABuFfojmUP+mREB2dpy/XVNq77kiTfi69mgX4bZDKuJF705vrtasIZZ9
	6ildLzakTv/xPi+IF6l2BUZZjRlGL6iGjO+c03o=
X-Google-Smtp-Source: ACcGV63oGfnB6uqy9NouXtr6nFTXPH02Em+F4U/9EHCxJ1OXkILC1wryncB5McCmdMHgx+Nwklnvgi5vdy93fZr8axM=
X-Received: by 2002:a37:655:: with SMTP id 82-v6mr7078875qkg.223.1539376480070;
	Fri, 12 Oct 2018 13:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181012195000.4545-1-raj.khem@gmail.com>
	<20181012195801.GV19188@beryl>
	<CAMKF1spE0fJTErUNg=ifQx9s2T-UybjAL++GFwZM+Pyi77pJwg@mail.gmail.com>
	<20181012203149.GW19188@beryl>
In-Reply-To: <20181012203149.GW19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 13:34:13 -0700
Message-ID: <CAMKF1sqh743UGN0DeWEoR1jX=2NQYGtwh+ONEg+q0MTXkkx3aA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
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
X-List-Received-Date: Fri, 12 Oct 2018 20:34:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 1:31 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Fri, Oct 12, 2018 at 01:01:41PM -0700, Khem Raj wrote:
> > On Fri, Oct 12, 2018 at 12:58 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > Are you still trying to do world builds? :)
> > >
> >
> > yes. with the patches I send in this week meta-ti seems to behave in
> > multi-BSP setup
> > I will soon add it to bblayers.conf for Yoe distro and it will start
> > testing on meta-openembedded CI builds, atleast for not nosing other
> > BSPs, I dont have infra to do world build for all the machines
> >
> > but if you were to pick Yoe distro and run with it for machines you
> > are interested in
> > that would be awesome.
> >
> > See. https://github.com/YoeDistro/yoe-distro, everyone having interesting boards
> > is welcome to run world builds using that and report problems.
>
> I can probably add it to my CI loop as well - I already do extensive builds
> and tests on Arago, Poky and distroless.

Cool thanks. Although you wont need all of above
after this :)

>
>
> > > Most of the places with this QA warning that are part of our builds were fixed
> > > before, but there are some outdated recipes like this one which were left out.
> > >
> > >
> > > On Fri, Oct 12, 2018 at 12:50:00PM -0700, Khem Raj wrote:
> > > > Fixes do_package_qa warnings
> > > > <FILE> is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > index 603a01a7..6c61a4e9 100644
> > > > --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > @@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
> > > >
> > > >  do_install() {
> > > >       install -d ${D}${datadir}/${PN}
> > > > -     cp -a ${S}/* ${D}${datadir}/${PN}
> > > > +     cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
> > > >  }
> > > >
> > > >  FILES_${PN} += "${datadir}/${PN}"
> > > > --
> > > > 2.19.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

