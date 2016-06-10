Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 303CAE00D86; Fri, 10 Jun 2016 09:17:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EF8BE00CE6
	for <meta-ti@yoctoproject.org>; Fri, 10 Jun 2016 09:16:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AGGsoc007838;
	Fri, 10 Jun 2016 11:16:55 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AGGs3l008488;
	Fri, 10 Jun 2016 11:16:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Jun 2016 11:16:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AGGsoY024832;
	Fri, 10 Jun 2016 11:16:54 -0500
Date: Fri, 10 Jun 2016 12:16:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Maciej Sobkowski <maciejjo@maciejjo.pl>
Message-ID: <20160610161653.GH2466@edge>
References: <8038bced-7ae3-e0d2-56f1-f0f3e364b108@maciejjo.pl>
MIME-Version: 1.0
In-Reply-To: <8038bced-7ae3-e0d2-56f1-f0f3e364b108@maciejjo.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: ti-cgt-pru-native fails to build
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
X-List-Received-Date: Fri, 10 Jun 2016 16:17:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 07, 2016 at 02:34:27PM +0200, Maciej Sobkowski wrote:
> Hi all,
> 
> I am currently trying to create load for PRU core on Beaglebone Black. I
> have some PASM code I want to compile and copy to root filesystem.
> 
> I added following directive to my recipe:
> 
> DEPENDS = "ti-cgt-pru-native"
> 
> but the build of ti-cgt-pru-native fails with QA errors complaining
> about wrong license files:
> 
> ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: QA Issue: ti-cgt-pru-native: LIC_FILES_CHKSUM points to an invalid file:
> /home/maciejjo/yocto/build-glibc/work/x86_64-linux/ti-cgt-pru-native/2.1.1-r0/ti-cgt-pru-2.1.1/ti-cgt-pru_2.1.1/LICENSE.txt [license-checksum]

It doesn't look like your package was correctly installed/extracted, since the 
license file cannot be found for validation.


> ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: Fatal QA errors found, failing task.
> ERROR: ti-cgt-pru-native-2.1.1-r0 do_configure: Function failed: do_qa_configure ERROR: Logfile of failure stored in:
> /home/maciejjo/yocto/build-glibc/work/x86_64-linux/ti-cgt-pru-native/2.1.1-r0/temp/log.do_configure.88
> ERROR: Task 1028 (virtual:native:/home/maciejjo/devel/openembedded/project/build/meta-ti/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb,
> do_configure) failed with exit code '1'
> 
> Are there any additional steps needed to be done before building this
> recipe, or is this an error in file location?
> 
> And more importantly, is what I'm trying to do the correct method for
> building PRU applications with meta-ti?
> 
> Br,
> 
> -- 
> Maciej Sobkowski
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

