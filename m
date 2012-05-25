Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7219CE01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 02:22:36 -0700 (PDT)
Received: from [192.168.0.2] (host86-170-72-228.range86-170.btcentralplus.com
	[86.170.72.228]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4344A60E52
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 10:22:35 +0100 (BST)
Message-ID: <4FBF4F5A.8070507@r-finger.com>
Date: Fri, 25 May 2012 10:22:34 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120329 Icedove/10.0.3
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <3408799.xmIZDQfG6A@linux-oxe9>
In-Reply-To: <3408799.xmIZDQfG6A@linux-oxe9>
Subject: Re: meta-ti and poky
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2012 09:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25/05/12 08:45, Gyorgy Kovesdi wrote:
> I just cloned Poky, and have my first running yocto build for Beagleboard-C4 without any problem.
> I tried to add meta-ti, but bitbake gives this error message for all targets:

FWIW, I have not been able to use meta-ti as a layer with Poky; ended up
just picking the packages I want from there.


> Another question is the current state of Beagleboard support here. I found some mails about it, but
> reportedly it is not fully supported here. I see that some recipes are written for Angstrom project.
> Is it possible to get running libgles-omap3 here? I used it for Angstrom, but it works only with 2.6 kernels .

I got libgles-omap3 working on an xM board with a 3.2.16 kernel (that
is, I got the native GLES working, the DRI2 drivers do not work; I have
not tested the X11 driver for kdrive).

To get it work, I had to get packages from the arago project repo, could
not get it work for any kernel in the angstrom meta-ti mirror. See
https://github.com/Guacamayo/meta-guacamayo, if that is of any use (work
in progress).

Tomas

