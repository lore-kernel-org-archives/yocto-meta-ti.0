Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B85AE00777; Sun,  6 Nov 2016 15:55:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36179E00546
	for <meta-ti@yoctoproject.org>; Sun,  6 Nov 2016 15:55:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA6Nt7E4014642;
	Sun, 6 Nov 2016 17:55:07 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA6Nt7Xo024512;
	Sun, 6 Nov 2016 17:55:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 6 Nov 2016 17:55:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA6Nt7Ke005096;
	Sun, 6 Nov 2016 17:55:07 -0600
Date: Sun, 6 Nov 2016 18:55:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "=?utf-8?B?0KjQsNGA0LjRhdC40L0g0JTQvNC40YLRgNC40Lkg0KHQtdGA0LPQtdC10LI=?=
	=?utf-8?B?0LjRhw==?=" <SharihinDS@energomera.ru>
Message-ID: <20161106235506.GB1940@edge>
References: <1478251939.5248.11.camel@energomera.ru>
	<20161104202035.GT12745@edge>
	<1478338321.1720.4.camel@energomera.ru>
MIME-Version: 1.0
In-Reply-To: <1478338321.1720.4.camel@energomera.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Unable to build ti-ccsv6-native and other packages
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
X-List-Received-Date: Sun, 06 Nov 2016 23:55:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Nov 05, 2016 at 09:32:01AM +0000, Шарихин Дмитрий Сергеевич wrote:
> On Пт, 2016-11-04 at 16:20 -0400, Denys Dmytriyenko wrote:
> > > Does anybody encountered same problem? How can I fix this issue?
> > CCS requires manual download due to licensing -
> > install.source.dir.local is a 
> > fake address and a placeholder to fail download attempts if CCS
> > tarball was 
> > not already provided.
> 
> Thanks, but here's another question: why ipumm-fw do require CCS? Is
> build process for firmware so complex, so for some megabytes of
> firmware I should install the whole Eclipse?

CCS currently bundles some of the TI CodeGen toolchains that are not yet 
available standalone otherwise. Once that gets resolved, there won't be a 
need for CCS dependency anymore.

-- 
Denys

