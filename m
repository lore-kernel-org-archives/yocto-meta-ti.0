Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6B47E01308
	for <meta-ti@yoctoproject.org>; Sun, 28 Apr 2013 13:10:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3SKArdS027360;
	Sun, 28 Apr 2013 15:10:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3SKAr1k018103;
	Sun, 28 Apr 2013 15:10:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 28 Apr 2013 15:10:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3SKAq8o012228;
	Sun, 28 Apr 2013 15:10:52 -0500
Date: Sun, 28 Apr 2013 16:10:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jon Szymaniak <jon.szymaniak+gpg@gmail.com>, <sallen@ti.com>
Message-ID: <20130428201051.GB11072@edge>
References: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: linux-ti-staging fetcher failures
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
X-List-Received-Date: Sun, 28 Apr 2013 20:10:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Apr 28, 2013 at 01:50:55PM -0400, Jon Szymaniak wrote:
> Hi all,
> 
> I just wanted to inquire about the status of git.ti.com, which the
> linux-ti-staging_3.8.bb recipe clones from.
> 
> I've been trying to bring up my am335xevm, and have been constantly getting
> timeouts from git.ti.com for the last few days.  I've had no luck manually
> cloning the kernel from this server -- is this not publicly accessible?

Jon,

Thanks for your inquiry! Unfortunately, I also noticed that git.ti.com was not 
accessible from outside since at least Friday. I will let our admins know, so 
they can take a look at the problem. Sorry for the inconvenience.

-- 
Denys

