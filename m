Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B570E00ABE; Wed, 17 Oct 2018 12:37:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AA6CE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:37:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HJbHnE064465;
	Wed, 17 Oct 2018 14:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539805037;
	bh=pVuNghDzgPu4Ge2QFOiJQirTO3I67LiDEOqG3qHAumc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nLqhZHHXsM4QfGN8EqLij8XGFoz3DUAs9/woSwO7yRUA3ABSQVJ10MtyT+pFwaA5y
	aTiaSPH9C03KUxbInDJjlm/Dx0zxIyXFGnCJHIJF7WUA11QMzZMsaPqhWCOW1pFhKE
	vfBVP7H6SylqRIIEpllr0XIBrr5nT6PKfchWyZhY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJbHtZ023286;
	Wed, 17 Oct 2018 14:37:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 14:37:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 14:37:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJbGji028219;
	Wed, 17 Oct 2018 14:37:17 -0500
Date: Wed, 17 Oct 2018 15:37:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017193716.GH4031@beryl>
References: <CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
	<CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
	<20181017112615.GT1032@bill-the-cat>
	<CAMKF1srPbZ_8XKeKt=aMSrHCPZNAQULb4P8atahBLjm21Zvb9g@mail.gmail.com>
	<20181017192501.GG4031@beryl>
	<CAMKF1sqMCEGkNyOK_WgN6KfKs+_30tq-_868SrkSmxAjbRhGAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqMCEGkNyOK_WgN6KfKs+_30tq-_868SrkSmxAjbRhGAA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Wed, 17 Oct 2018 19:37:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 17, 2018 at 12:27:19PM -0700, Khem Raj wrote:
> On Wed, Oct 17, 2018 at 12:25 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > Yeah I saw that but this patch is not their in 2018.01 release that TI
> > > > fork
> > > > > is based on regardless I backported this patch to this version it did not
> > > > > bring the size below mark
> > > > > I think it’s because we are using hardened toolchain and that enalbles
> > > > > extra options to enable pie and ssp since these options get added to CC
> > > > > they get passed into uboot straight
> > > > >
> > > > > I think we should just disable security flags for u boot in OE and may be
> > > > > uboot make system should append fno-pie fno-stack-protector to nullify
> > > > > these options
> > > >
> > > > OK, do you want to submit a patch for that or should I do one and just
> > > > Suggested-by you?  Thanks!
> > >
> > >
> > > This would not be acceptable change since it changes how we build gcc
> > > itself secondly it does not happen for master uboot
> > >
> > > However if this works then we need to understand why it increas e the size
> >
> > Even if this change is not acceptable upstream, I would prefer it locally in
> > meta-ti recipe, instead of disabling more features to free up 5-6KB in SPL.
> 
> this is a distro level change. meta-ti is not appropriate place to decide that

Are we talking about passing fno-pie and fno-stack-protector to U-boot build 
that you suggested above? That is what I'm referring here. It can be BBB 
specific patch. That is until we figure out why it grows code so much...

-- 
Denys

