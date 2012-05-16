Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F7F5E0140C
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:58:00 -0700 (PDT)
Received: by eaab16 with SMTP id b16so293373eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RdcB0eDy/lhN8pqpft196duXAC2IeZnL6TKREBrf4/o=;
	b=hGl3GjCVhCbcug1iRH0Q8HovBDSJXB/n24A/KifOhT8vMAWPD+TdsY8xicXoVRh6lr
	cIsbkh+3FArL/+NzRsnD7PF4MTNUV4fquFtZSGLJ4ZhSBk4eeUcqJztA7s/fOHOHCbiS
	o8x0OeFRNA4sVxlCKwaIc9iuCrXql24luywGnvmmnrUdF+z1QhbX7ObY54BztPTidNYv
	QjOHLr1kCnozn7mwWdD0GJiPlVWgjsUkpG8Xyap0rn+5VRp5jYeFvMQgnA2zC7GMLisE
	attW+quFNLh6nyGoVgUY5cUO9iBHLVhK94BuB77tdSxSkKIkTSxUbdmSEOCYlwnA56uB
	WtJQ==
Received: by 10.14.47.136 with SMTP id t8mr819919eeb.84.1337187479765; Wed, 16
	May 2012 09:57:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 09:57:29 -0700 (PDT)
In-Reply-To: <CAN-pQAS=L-VKUYqYRNqYHGOrhHf69KjZJ0PGFtFjJHccefHGng@mail.gmail.com>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
	<CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
	<CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
	<CAN-pQAS=L-VKUYqYRNqYHGOrhHf69KjZJ0PGFtFjJHccefHGng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 09:57:29 -0700
Message-ID: <CAMKF1sqiMSbf6+KSc-L5w7Aqeg2zbLB3xgKSf-CSPTn4iVug_Q@mail.gmail.com>
To: Nick G <exosyst+metaTI@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building issues with meta-toolchain on Beaglebone
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
X-List-Received-Date: Wed, 16 May 2012 16:58:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 9:32 AM, Nick G <exosyst+metaTI@gmail.com> wrote:
> /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:169:61:
> error: no include path in which to search for limits.h

this is the error. I have seen this error in past look for patches in
master against
gcc recipes where this might be fixed.

