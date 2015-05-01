Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9674E00994; Fri,  1 May 2015 13:02:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99BC6E0098A
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2015 13:02:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41K2itJ031326;
	Fri, 1 May 2015 15:02:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41K2gHS022292;
	Fri, 1 May 2015 15:02:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 15:02:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41K2g2V032275;
	Fri, 1 May 2015 15:02:42 -0500
Date: Fri, 1 May 2015 16:02:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Craig McQueen <craig.mcqueen@innerrange.com>
Message-ID: <20150501200241.GE29290@edge>
References: <5500469A22567C4BAF673A6E86AFA3A402227F4FAA84@IR-CENTRAL.corp.innerrange.com>
MIME-Version: 1.0
In-Reply-To: <5500469A22567C4BAF673A6E86AFA3A402227F4FAA84@IR-CENTRAL.corp.innerrange.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Error when recompiling linux-ti-staging kernel
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
X-List-Received-Date: Fri, 01 May 2015 20:02:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 30, 2015 at 10:50:12AM +1000, Craig McQueen wrote:
> I'm using meta-ti with Poky dizzy to build linux-ti-staging 3.14.x for a 
> BeagleBone Black based system.
> 
> When I do a rebuild of linux-ti-staging, it does most of the compile but 
> then fails with an error:
> 
> | touch: cannot touch '/home/craigm/yocto/poky/<boardname>/tmp/work/<boardname>-poky-linux-gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/image/lib/modules/3.14.39/build': Permission denied
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compileconfigs (log file is located at /home/craigm/yocto/poky/<boardname>/tmp/work/<boardname>-poky-linux-gnueabi/linux-ti-staging/3.14.39-r22b+gitrAUTOINC+ba552b4bc7/temp/log.do_compileconfigs.4657)
> 
> Checking that file, I find that it's a symlink that points to 
> /usr/src/kernel, which doesn't exist.
> 
> My current work-around is to do "bitbake linux-ti-staging -c clean" then 
> rebuild my image. It works fine as long as it's a fresh build. But that 
> slows down the development cycle.
> 
> Why might this be happening?

Hmm, interesting. Which branch of meta-ti do you use for dizzy?

-- 
Denys

