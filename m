Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30E74E013EB
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:25:33 -0700 (PDT)
Received: by eekb45 with SMTP id b45so288524eek.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ob0DOMKwo0AbWahNcrFYCiSeroFJDw63oA/Ua1QlNjg=;
	b=1Iw+63ORoHCLh0MEvQUWfqsTjeXOUjl8iMAicbh6dW+CITM2vTMkyBfEs2KNNavUpz
	93boOPXwT7MyDkgmGkmEvT9scqK2qwYCckNtKgTwMncw0K/T5jAH7fN0pdS2N5+rLjUP
	BNbdmfHzOzvz/Pl9pG5/q+LTyeWCMDYGmu/k9BvQTkWSc1gXftUtq8T8hAyLo7e/qzw0
	syioUdKnDfsO4U4R4FVw6nZdGEkTMIna5o5tuYmrEnQfQbuvavYARz/TDm7a7M+jE+/Y
	xSm7ibthFLKTIZYcRX2qCdjLvx+36crZw9hcuwhMoOIyHy1KA0uSLvhbyIw6YHMchPJB
	qF7g==
Received: by 10.213.28.3 with SMTP id k3mr756014ebc.141.1337185531844; Wed, 16
	May 2012 09:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 09:25:01 -0700 (PDT)
In-Reply-To: <CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
	<CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 09:25:01 -0700
Message-ID: <CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 May 2012 16:25:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 12:26 AM, Nick G <exosyst+metaTI@gmail.com> wrote:
> Hey guys,
>
>
> I'm basing this on poky-denzil with the denzil branch of meta-oe and meta=
-ti
> checked out as well.
> I set my machine to be beaglebone and added meta-oe and meta-ti to the
> config options and managed to successfully build the core-image-minimal
> using bitbake. I now want to generate a standalone toolchain which, *I
> believe* is done with meta-toolchain (please correct me if I'm wrong).
>

thats right

> Unfortunately this fails with the rather long error I'll post below for
> search engines' sake.
>
> Is this a known bug? Is there a workaround?
>
> Thanks,
> Nick
>
> | checking how to run the C preprocessor...=C2=A0 arm-poky-linux-gnueabi-=
gcc -E
> | configure: error: in
> `/media/scratch/poky-denzil-7.0/beaglebone/tmp/work/i686-nativesdk-pokysd=
k-linux/gcc-cross-canadian-arm-4.6.3+svnr184847-r25/gcc-4_6-branch/build.i6=
86-pokysdk-linux.arm-poky-linux-gnueabi/arm-poky-linux-gnueabi/libgcc':
> | configure: error: C preprocessor " arm-poky-linux-gnueabi-gcc -E" fails
> sanity check

these errors happen if some prerequisite did not get staged properly.
Can you reproduce it everytime ? e.g. building from scratch ? you can
send the config.log
that sits on top of gcc-canadian-cross builddir that will have additional i=
nfo

