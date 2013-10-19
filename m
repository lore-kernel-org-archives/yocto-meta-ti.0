Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E265E016DC
	for <meta-ti@yoctoproject.org>; Sat, 19 Oct 2013 04:22:35 -0700 (PDT)
Received: from [173.34.6.101] (port=34319 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VXUc6-0001Ew-SW
	for meta-ti@yoctoproject.org; Sat, 19 Oct 2013 07:22:34 -0400
Date: Sat, 19 Oct 2013 07:22:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
In-Reply-To: <alpine.DEB.2.02.1310190646210.20906@oneiric>
Message-ID: <alpine.DEB.2.02.1310190717170.9159@oneiric>
References: <alpine.DEB.2.02.1310190646210.20906@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: using yocto and meta-ti to build for beaglebone black?
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
X-List-Received-Date: Sat, 19 Oct 2013 11:22:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 19 Oct 2013, Robert P. J. Day wrote:

>
>   a couple quick questions. first, as an example for a tutorial, i
> want to show using yocto and meta-ti to build a simple
> (core-image-minimal?) for a BBB. it seems simple enough -- i just
> configured a new build directory, added the meta-ti layer, set MACHINE
> to "beaglebone" and it's cranking away on all 8 cores as we speak.
>
>   i'm well aware of the recent u-boot uImage->zImage switch, which
> makes me happy. :-) so as long as i get valid artifacts dumped into
> the images/ directory when this is over, i figure i can take it from
> there. as i'm using the master branch for everything (oe-core,
> meta-ti), should this just work?
>
>   also, i just noticed the meta-ti recipe for "x-load". isn't this
> just for generating the "MLO" file required by a number of TI boards
> that u-boot takes care of these days? what's the relationship between
> those two? is x-load just for TI machines for which u-boot doesn't
> generate an appropriate MLO file?

  at risk of adding another question to this earlier post, my build of
a core-image-minimal worked, and among other generated artifacts in
images/beaglebone/, i have the files:

 * MLO -> MLO-beaglebone-2013.10-r0+gitrAUTOINC+183acb7003
 * u-boot-spl.bin-beaglebone-2013.10-r0+gitrAUTOINC+183acb7003

which are very close in size. i'm used to just installing the MLO
file, so what's the difference here? what am i supposed to do with the
"spl" file?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


