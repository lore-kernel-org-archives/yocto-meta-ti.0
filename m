Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 634B6E00DA9; Tue, 23 Jan 2018 14:37:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A152E006D3
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 14:37:34 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0NMbY0A011179
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 16:37:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516747054;
	bh=HKBJPiQjXyDHS0njbIJkucKR2HpQgCZDRwVjBqLdBkg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BFexN6ZkW9HicKS3peU1fd0sa/gXbdEVxRYnzGwDuNtytwgAL70nUG6cLtPCOu8HM
	OIYidbg/5wAXID6ECLsucgPojznjetxwfJf6hZMSzL7AHqNoIo5xQLhOA+C1a7U1HY
	aZTJf3ZV3Eqxkda6X8DtKgYBoUxKPwPBFQKarxRk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0NMbYQe031274
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 16:37:34 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 23 Jan 2018 16:37:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 23 Jan 2018 16:37:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0NMbXTe014847;
	Tue, 23 Jan 2018 16:37:33 -0600
Date: Tue, 23 Jan 2018 17:37:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180123223733.GC10142@edge>
References: <1516053364-28226-1-git-send-email-m-radhakrishnan2@ti.com>
	<20180116032244.GA31964@edge>
MIME-Version: 1.0
In-Reply-To: <20180116032244.GA31964@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] i2c-lld-rtos: Adding dependency to pruss-lld-rtos for am335x, am437x and am57xx
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
X-List-Received-Date: Tue, 23 Jan 2018 22:37:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Mahesh, Jake,

Please clarify.


On Mon, Jan 15, 2018 at 10:22:44PM -0500, Denys Dmytriyenko wrote:
> Is this required for morty? Is it a bugfix?
> 
> 
> On Mon, Jan 15, 2018 at 04:56:04PM -0500, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> > index a178c27..674af36 100644
> > --- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> > +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
> > @@ -26,8 +26,12 @@ PR = "r0"
> >  DEPENDS_append = " osal-rtos \
> >  "
> >  DEPENDS_append_ti33x = " starterware-rtos \
> > +                         pruss-lld-rtos \
> >  "
> >  DEPENDS_append_ti43x = " starterware-rtos \
> > +                         pruss-lld-rtos \
> > +"
> > +DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
> >  "
> >  
> >  # Build with make instead of XDC
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

