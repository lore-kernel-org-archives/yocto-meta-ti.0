Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF925E00849; Wed, 24 Sep 2014 08:52:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73AC9E005BD
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 08:52:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8OFqBa8018205;
	Wed, 24 Sep 2014 10:52:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8OFqBDY003509;
	Wed, 24 Sep 2014 10:52:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 10:52:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8OFqBxS012543;
	Wed, 24 Sep 2014 10:52:11 -0500
Date: Wed, 24 Sep 2014 11:52:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140924155211.GZ6303@edge>
References: <1411405491-30435-1-git-send-email-denis@denix.org>
	<CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 3.14.19 with latest fixes
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
X-List-Received-Date: Wed, 24 Sep 2014 15:52:16 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Do you need to submit a bug report? Is it for kernel or some other component?


On Wed, Sep 24, 2014 at 07:26:41AM -0300, Diego Sueiro wrote:
> Denys,
> 
> Does TI provides a bug track system for community?
> 
> 
> Abraços,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/
> 
> On Mon, Sep 22, 2014 at 2:04 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > index 7667e1a..ae3773d 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > @@ -44,11 +44,11 @@ S = "${WORKDIR}/git"
> >
> >  BRANCH = "ti-linux-3.14.y"
> >
> > -SRCREV = "0261be2e3a30f496c2c8642b6709f4fc54e75391"
> > -PV = "3.14.17"
> > +SRCREV = "9202c29d25015b6f1ac6c124add4ca1666a679bf"
> > +PV = "3.14.19"
> >
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild
> > -MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> >
> >  KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
> > --
> > 2.0.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


