Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35375E0079E; Wed,  3 Sep 2014 19:46:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08D0AE004A0
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 19:46:11 -0700 (PDT)
Received: by mail-ie0-f176.google.com with SMTP id x19so10912464ier.21
	for <meta-ti@yoctoproject.org>; Wed, 03 Sep 2014 19:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bdJqriN92iw7AaO5p7dXBALTktAeK2kSpPd90+gIzkk=;
	b=mln2Bx6LJd9jMRMglHYAtXDRH+alEiXyHEpcwKOUYpNPkJN4OlNWaVl2WG2gnsoQoK
	Ri8Hi1djlpNRVt4zL/Rs76tAGPdXZ2C90LfKBqx3VXb4SgOAzcov2JBrlsD+AIOofihX
	e96DA7NySuRUmgXFVDBCaqOJjAw03dXUFzDeSiDVN/3yXl2v+KUfRn2olhxmp4utJDxY
	I9fbNmG4uApZAOkp6dJASYPZTJNFjNmuCVFYSghRKQwNSsl/t08xHFmcBfDbJ3ChVu9I
	HbQROy2IRTs9uZFstAPFv/jmYpEvh/+l5zOKfecec7v1HWx0As11Yq1rkCgbE0vy0iA6
	5Lcg==
MIME-Version: 1.0
X-Received: by 10.43.138.65 with SMTP id ir1mr1380001icc.55.1409798770744;
	Wed, 03 Sep 2014 19:46:10 -0700 (PDT)
Received: by 10.107.166.16 with HTTP; Wed, 3 Sep 2014 19:46:10 -0700 (PDT)
In-Reply-To: <5407C780.5040801@pabigot.com>
References: <5407C780.5040801@pabigot.com>
Date: Wed, 3 Sep 2014 21:46:10 -0500
Message-ID: <CAOCHtYhyBZs512mArExutSkK6Y_HPpeCNaUeuvJre22zyZ82PQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 02:46:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> I've been trying to figure out why OpenEmbedded on beaglebone is three times
> slower than Debian on the ray-tracing application described at:
>
> http://scruss.com/blog/2013/09/23/beaglebone-black-slow-as-a-dog/
>
> Part of it is due to meta-yocto-bsp's beaglebone config not enabling CPU
> frequency control (CONFIG_GENERIC_CPUFREQ_CPU0, CONFIG_VOLTAGE_DOMAIN_OMAP,
> and some THERMAL options).  That can be fixed for linux-yocto, and isn't an
> issue with linux-ti-staging, but it doesn't eliminate the discrepancies.
>
> With debian, the sample program described in that blog posting runs this
> fast:
>
>   debian@beaglebone:~$ g++ -Ofast -mfloat-abi=hard -o card card.cpp
>   debian@beaglebone:~$ time ./card > /dev/null
>   real    4m54.846s
>   user    4m54.627s
>   sys     0m0.057s
>
> With poky master + meta-ti it runs this fast:
>
>   root@beaglebone:~# time ./card > /dev/null
>   real    9m37.901s
>   user    9m37.200s
>   sys     0m0.150s

This seems very odd, what version of g++ do you have on poky?

On debian wheezy, we have the old:

gcc version 4.6.3 (Debian 4.6.3-14)

Which really doesn't have any of the linaro special sauce..

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

