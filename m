Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07BBDE014E0
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 12:28:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42JS37m012722;
	Thu, 2 May 2013 14:28:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42JS3rY025711;
	Thu, 2 May 2013 14:28:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 14:28:03 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r42JS39K014373;
	Thu, 2 May 2013 14:28:03 -0500
Date: Thu, 2 May 2013 15:28:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Allen, Scott (ITS)" <sallen@ti.com>
Message-ID: <20130502192802.GC2364@edge>
References: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
	<20130428201051.GB11072@edge>
	<CANge7vXrkgrcOyn8Sn2wC5qXLOw2FwzVqW9QfOjs-tBLuirkxw@mail.gmail.com>
	<31331E6D91818F49B78B9920E96E64C704A3B444@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <31331E6D91818F49B78B9920E96E64C704A3B444@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Jon Szymaniak <jon.szymaniak+gpg@gmail.com>
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
X-List-Received-Date: Thu, 02 May 2013 19:28:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Scott!

On Thu, May 02, 2013 at 02:45:09PM -0400, Allen, Scott (ITS) wrote:
> All, network team has identified a routing issue and made some corrections. 
> Initial testing indicates this resolved the problem.
> 
> Please try/ test again and let me know if the problem continues.
> 
> -scott
> 
> 
> -----Original Message-----
> From: jon.szymaniak@gmail.com [mailto:jon.szymaniak@gmail.com] On Behalf Of Jon Szymaniak
> Sent: Sunday, April 28, 2013 9:10 PM
> To: Dmytriyenko, Denys
> Cc: Allen, Scott (ITS); meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] linux-ti-staging fetcher failures
> 
> On Sun, Apr 28, 2013 at 4:10 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Sun, Apr 28, 2013 at 01:50:55PM -0400, Jon Szymaniak wrote:
> >> Hi all,
> >>
> >> I just wanted to inquire about the status of git.ti.com, which the 
> >> linux-ti-staging_3.8.bb recipe clones from.
> >>
> >> I've been trying to bring up my am335xevm, and have been constantly 
> >> getting timeouts from git.ti.com for the last few days.  I've had no 
> >> luck manually cloning the kernel from this server -- is this not publicly accessible?
> >
> > Jon,
> >
> > Thanks for your inquiry! Unfortunately, I also noticed that git.ti.com 
> > was not accessible from outside since at least Friday. I will let our 
> > admins know, so they can take a look at the problem. Sorry for the inconvenience.
> >
> > --
> > Denys
> 
> Thank you Denys!
> 
> FWIW, a friend of mine who's a couple miles away and on the same ISP is able to clone the kernel and visit the git web front-end.  Nothing jumped out at me when comparing our traceroute/tracepath results -- everything's largely the same. I also see that ICMP seems blocked for me, but not for him.
> 
> Strange...let me know if I can provide any useful info.
> 
> - Jon

