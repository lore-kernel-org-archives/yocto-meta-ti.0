Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D4B8E00B92; Fri, 12 Oct 2018 13:02:09 -0700 (PDT)
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
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3427E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:02:08 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u34-v6so15148700qth.3
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4n0gtlgTAggPoxot54G1O6sUsRNhVkWeMU0qAmCp/P4=;
	b=itZTrV+iQHssMCPTDysoCW5EGalNs5DxjB24eMVdVI0cLx6nk4Ej6kzKP5M7pAb6h2
	Ij2SU5mquqEQmPrutfHqnQln94NmWrVLF378yIRENjoBXmIsYFKBEDrSthnDm2hm+J2n
	o5qftRxz46PHT8bYEyd25I6tuuHixUhnEEEEpBVPIlwaXMsqi/KrMQljPiN1G9w83HV4
	5HuZRrifJ5/GvnwdaLbwjA9UkSALsURFIUD4cInnFOCyXCt7gHl87XWsQoR3SJh8dwWv
	VApd8wg3B3+jYpnkMJDWX+8BOim4c/mu7KFY5mPc3YckuKZ6FEpOcqMsel/JcuoonEl2
	amFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4n0gtlgTAggPoxot54G1O6sUsRNhVkWeMU0qAmCp/P4=;
	b=EVQRp4S5H9B4MAtABSs8KWCNfuuUEZNtR9hnVH73B9DthSq8pzKjksySZUbxpFu5Cm
	OrEgAuhKIzgKJfNmQH+JyYDihVJtAHwoYeoUVAUT4NqoID+nlWr9r6TeJyNLvGlX4dqM
	OaRhSoKalJJCGR92b3qlb07nd284bvxgZN0gb9z1YVvDQ2jT+BQ4Y37s7J77KfzM2HCz
	67vy0WUAP5tWjcYUCBDvOFHKIWrQO4HMykDqbe2z+1QnPoWAjzaFVAxsHcTA6ITiNCQn
	ZB3si6tOoWVANxX5w8U89W5+2Fyqfd6DpOPC2Csi0h9UnbaGxgKB3NKs6bi8cb/N016p
	JQ3g==
X-Gm-Message-State: ABuFfogNfDbADyVRqLUJ/1yrvd9dayETJauzCtuMEyGpZfQhd2g31fd9
	bVtDAkBFCmtJyCZoS5SV84G35XV+Ugri9uE1d3o=
X-Google-Smtp-Source: ACcGV63UqTyQnmvgGmDJu/09l8RJ9r69z84CNmrAjHrB9RZ5JLHYH8xren3z6cqbsWFQEStfQ+uyAvxAu2/5SQPFRwI=
X-Received: by 2002:ac8:4790:: with SMTP id
	k16-v6mr7203517qtq.253.1539374528049; 
	Fri, 12 Oct 2018 13:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20181012195000.4545-1-raj.khem@gmail.com>
	<20181012195801.GV19188@beryl>
In-Reply-To: <20181012195801.GV19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 13:01:41 -0700
Message-ID: <CAMKF1spE0fJTErUNg=ifQx9s2T-UybjAL++GFwZM+Pyi77pJwg@mail.gmail.com>
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
X-List-Received-Date: Fri, 12 Oct 2018 20:02:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 12:58 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> Are you still trying to do world builds? :)
>

yes. with the patches I send in this week meta-ti seems to behave in
multi-BSP setup
I will soon add it to bblayers.conf for Yoe distro and it will start
testing on meta-openembedded CI builds, atleast for not nosing other
BSPs, I dont have infra to do world build for all the machines

but if you were to pick Yoe distro and run with it for machines you
are interested in
that would be awesome.

See. https://github.com/YoeDistro/yoe-distro, everyone having interesting boards
is welcome to run world builds using that and report problems.

> Most of the places with this QA warning that are part of our builds were fixed
> before, but there are some outdated recipes like this one which were left out.
>
>
> On Fri, Oct 12, 2018 at 12:50:00PM -0700, Khem Raj wrote:
> > Fixes do_package_qa warnings
> > <FILE> is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > index 603a01a7..6c61a4e9 100644
> > --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > @@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
> >
> >  do_install() {
> >       install -d ${D}${datadir}/${PN}
> > -     cp -a ${S}/* ${D}${datadir}/${PN}
> > +     cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
> >  }
> >
> >  FILES_${PN} += "${datadir}/${PN}"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

