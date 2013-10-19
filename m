Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C4B6E016D6
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 19:39:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9J2dtFm023793;
	Fri, 18 Oct 2013 21:39:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9J2dt8l029747;
	Fri, 18 Oct 2013 21:39:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 21:39:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9J2dscd002021;
	Fri, 18 Oct 2013 21:39:55 -0500
Date: Fri, 18 Oct 2013 22:39:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-ID: <20131019023954.GK2127@edge>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
	<20131017214528.GC30989@edge>
	<CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+gsK-qKLdXTq1PJEmXLp0d5n5wEYf+6Na+pFj+UwnWLO_dt2g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Sat, 19 Oct 2013 02:39:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 18, 2013 at 06:09:23PM -0700, Rudolf Streif wrote:
> Well, I rebuilt with a newer version of meta-ti
> (master, b3df09902da0d2469a02e9975d404e26c4c5ec0e). Now the /dev/fb0 device
> is in the root file system. However:
> 
>    - Kernel image is now zImage but u-boot environment still looks for
>    uImage; work around that and then

u-boot has changed the preferred default from uImage to zImage somewhere 
between 2013.10-rc4 and the final 2013.10 release. The kernel now builds 
zImage by default and there's corresponding u-boot update:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3f3bad888972776b4740f7210e709b74362631f5

Looks like you hit it at the wrong time... Sorry, that sometimes happens 
when there are multiple components being actively developed and the API 
between them changes...


>    - kernel panic - not syncing: Attempting to kill init! exitcode=0x0b.

Have you tried the latest update to 3.12-rc5? That combination seems to be 
building and booting fine, according to our automated reports:

http://article.gmane.org/gmane.linux.embedded.yocto.meta-arago/1245


> One step forward, two steps back. Pulled again, and this time build fails
> because branch ti-linux-312.y is not available.

The branch was and is called ti-linux-3.12.y and it hasn't changed since the 
beginning of 3.12 integration and is still there:

http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=shortlog;h=refs/heads/ti-linux-3.12.y


> What branch of meta-ti and what commit is working?

Both master and dylan are currently in sync and always are, when it comes to 
3.12-rc5 kernel and 2013.10 u-boot. Other recipes can differ between master 
and dylan, but the integration trees are the same. The above link to automated 
build and test report used dylan branch of meta-ti and the latest commit ID of 
f61008a20340373247ebfd8f381e377b21f11afe. If you want to use meta-ti master, 
then the corresponding commit ID is c11504664990f007c3903d349e7cc135a904f8e2.

-- 
Denys

