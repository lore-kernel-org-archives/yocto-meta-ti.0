Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CA4EE0076F
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 07:28:09 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BFS6E1018611;
	Tue, 11 Feb 2014 09:28:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BFS6vE008546;
	Tue, 11 Feb 2014 09:28:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Feb 2014 09:28:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BFS6gF016513;
	Tue, 11 Feb 2014 09:28:06 -0600
Date: Tue, 11 Feb 2014 10:28:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140211152805.GK3131@edge>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 15:28:10 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 11, 2014 at 01:04:00PM -0200, Diego Sueiro wrote:
> Adding these line on beaglebone.conf still builds 4.09.00.01 version:
> PREFERRED_VERSION_libgles-omap3 = "5.01.00.01"
> PREFERRED_VERSION_omap3-sgx-modules = "5.01.00.01"
> 
> Some outputs:
> 
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-dev)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01

Are you using the latest meta-ti?


>  NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for
> item libgles-omap3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-flipwsegl-es3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-flipwsegl-es5)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-flipwsegl-es6)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-flipwsegl-es8)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-flipwsegl-es9)
> NOTE: versions of libgles-omap3 available: 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-linuxfbwsegl-es3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-linuxfbwsegl-es5)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-linuxfbwsegl-es6)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-linuxfbwsegl-es8)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-linuxfbwsegl-es9)
> NOTE: versions of libgles-omap3 available: 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-es3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-es5)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-es6)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-es8)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-es9)
> NOTE: versions of libgles-omap3 available: 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-blitwsegl-es3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-blitwsegl-es5)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-blitwsegl-es6)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-blitwsegl-es8)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-blitwsegl-es9)
> NOTE: versions of libgles-omap3 available: 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-frontwsegl-es3)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-frontwsegl-es5)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-frontwsegl-es6)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-frontwsegl-es8)
> NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
> 4.09.00.01
> NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
> libgles-omap3-frontwsegl-es9)
> NOTE: versions of libgles-omap3 available: 4.09.00.01
> 
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> 
> /*long live rock 'n roll*/
> 
> 
> On Tue, Feb 11, 2014 at 12:54 PM, Diego Sueiro <diego.sueiro@gmail.com>wrote:
> 
> >
> > On Tue, Feb 11, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> >> PREFERRED_VERSION_blah = "ver"
> >
> >
> > Can I add it im my image recipe, or do I need to add it on machine.conf?
> > Why the newest version is not selected by default?
> >
> > Abraços,
> >
> > --
> > *dS
> > Diego Sueiro
> >
> > Administrador do Embarcados
> > www.embarcados.com.br
> >
> > Engenheiro de Controle e Automação
> > UNIVERSIDADE FEDERAL DE ITAJUBÀ
> >
> >
> > /*long live rock 'n roll*/
> >

