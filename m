Return-Path: <aymericdumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB484E00566; Fri, 15 Aug 2014 12:46:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3ED7CE0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 12:46:36 -0700 (PDT)
Received: by mail-qa0-f48.google.com with SMTP id m5so2408429qaj.7
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=J1lOtUkR148Kw8MGsBVaU/SkQRyy1ER06f088ETHsy8=;
	b=jI15psVaGAdK6Eg5YOCMBq9E6yFaVbguX8BOijmB3v8oaDcD60+a91WO37DYsszxDV
	By+Uu/V6l7LKoKb6SyBl0dePtqsYp22VvsEL/DojYrDCmZhFuOesd4GRE7lhFFgjFpYa
	PBdO6jEuVkMGMbmOZ+rDCpnCwrUfc2JQ9uEyx6pzCqdzS8cXgznypPphjOLBC2N4aSTK
	1dLfo/Y44vQU6l6k926Yoa8e7Mft3gFL330zwHxb6P0sxC0cCBZ/Lb3VnrfrL6AZUt+h
	ED/xFNpd4jVRvaBGJA8qZrSiJukU0Cret4VMk3M6OaLqZYv+SvFxEIpPLl4jysPj+GZi
	yABw==
MIME-Version: 1.0
X-Received: by 10.229.178.138 with SMTP id bm10mr31403451qcb.16.1408131996195; 
	Fri, 15 Aug 2014 12:46:36 -0700 (PDT)
Sender: aymericdumaz@gmail.com
Received: by 10.224.53.74 with HTTP; Fri, 15 Aug 2014 12:46:36 -0700 (PDT)
In-Reply-To: <CAMCfZKE8KR2aS-ME1X694wqfzpegPM8JND9rF22ehoknj1+6=w@mail.gmail.com>
References: <1408119254-13052-1-git-send-email-aymeric.dumaz@gmail.com>
	<CAMCfZKE8KR2aS-ME1X694wqfzpegPM8JND9rF22ehoknj1+6=w@mail.gmail.com>
Date: Fri, 15 Aug 2014 21:46:36 +0200
X-Google-Sender-Auth: mYsMgjun3ys1CSYKkYeG16QyfXk
Message-ID: <CAESSzZx7wwX7gbTF+FxjWMqQvYvVdKK0RsJBOxD27UhMtGYcgw@mail.gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [dora/daisy][PATCH] libgles-omap3-5.01.01.01: add .ver and .list files
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
X-List-Received-Date: Fri, 15 Aug 2014 19:46:39 -0000
Content-Type: text/plain; charset=UTF-8

2014-08-15 19:01 GMT+02:00 Diego Sueiro <diego.sueiro@gmail.com>:
> Aymeric,
>
Hello Diego,

>
> On Fri, Aug 15, 2014 at 1:14 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com>
> wrote:
>>
>> When libraries don't have a SONAME in their section, their name aren't
>> added in
>> the .list/.ver files generated during do_package.
>> Other recipes are able to build against them but are not able to find them
>> afterwards, leading to missing dependencies.
>>
>> This patch add the files that would be created if the SONAME was present.
>>
>> Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
>
>
> Just for curiosity.
> To have libgles-omap3 installed on the image, with Qt5 stuff, I had to
> explicit add it on the IMAGE_INSTALL. This patch should fix it, is it
> correct?
>
>
> Regards,
>

When you add libgles-omap3 on the IMAGE_INSTALL, with the right flags Qt 5 is
compiled against it.
The problem is when you run "bitbake meta-toolchain-qt5", the resulting
toolchain doesn't have the libgles-omap3 libraries included.
If you look on the qtbase do_package log, you can see that:

NOTE: Couldn't find shared library provider for libGLESv2.so, used by files:
[...]

This is because for each library, Yocto will add the library name (coming from
the SONAME) to the .list/.ver files of the corresponding package.
Because for some reason those proprietary libraries don't have a SONAME, Yocto
fails to do so.

This patch is not 100% perfect, because files from others PACKAGES will produce
similar errors, for example:

DEBUG: calculating shlib requirements for libgles-omap3-es5
NOTE: Couldn't find shared library provider for libIMGegl.so, used by files:
[...]

But at least it permits other packages like qtbase to find the libgles-omap3
dependency, so that it will be included in the sysroot.
I made patches for oe-core (see [1] and [2]), if this is accepted it will be
possible to handle more gracefully with the ASSUME_SONAME variable.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095726.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095727.html

> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
>
> /*long live rock 'n roll*/

