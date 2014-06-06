Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC577E00B95; Fri,  6 Jun 2014 08:32:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cliff.brake[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10D80E00B88
	for <meta-ti@yoctoproject.org>; Fri,  6 Jun 2014 08:32:33 -0700 (PDT)
Received: by mail-qa0-f41.google.com with SMTP id dc16so4139343qab.0
	for <meta-ti@yoctoproject.org>; Fri, 06 Jun 2014 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ddBTkT4hZMntoCJgr6sI/XK1e2b2xUnrpQYg+ZHkoi0=;
	b=oetfTCirR7JVnTrtTKCq17XEXZqXuWOD/2RhO397m44fbB2HbRt6Qhq4qllJSRaljj
	Wd90gVHOCsitow+DskeNLIoejfDI8Owv3etbfHvzRBvFftuJhmvt1xbd/5SCWCyX5IET
	eOBvZ+SvmLvAl3d8GkRotyChS2XMzvMdgh3zAIpAe5aRGD/wN9R6M8J77dvPG9CEojMx
	LrxzRG0Nl45VSRnQTn2FpAOZkusHSLZ4yf4A1FydgnUfYAuNRIf2NyCnEYRPV+CGNZmK
	msWdnHuTCwsiMeBjhm8NOqeNtXqJZ0wUXdEIHtf03volvf9N2Pi0MGoWFxn2rWj9LDqL
	HYGw==
MIME-Version: 1.0
X-Received: by 10.224.40.131 with SMTP id k3mr9758223qae.5.1402068752429; Fri,
	06 Jun 2014 08:32:32 -0700 (PDT)
Received: by 10.140.31.73 with HTTP; Fri, 6 Jun 2014 08:32:32 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D09841A@DLEE11.ent.ti.com>
References: <CAOd_LFzCrgUGLKtgPUSQgxtd7ASn8Ee4oBbDyCSZH8yobh78pw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015D09841A@DLEE11.ent.ti.com>
Date: Fri, 6 Jun 2014 11:32:32 -0400
Message-ID: <CAOd_LFwesJcR4nan9Bp9E8dQVj6-GPOZFEU-6OCUjQcjdFd=Tw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: what branch of meta-ti should be used with dora?
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
X-List-Received-Date: Fri, 06 Jun 2014 15:32:43 -0000
Content-Type: text/plain; charset=UTF-8

got it.  Looking further, I happened to be using
https://github.com/Angstrom-distribution/meta-ti, so that is why I
don't see the dora branch.  Thanks!

On Fri, Jun 6, 2014 at 11:20 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
> Use the dora branch.
>
>>-----Original Message-----
>>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>bounces@yoctoproject.org] On Behalf Of Cliff Brake
>>Sent: Friday, June 06, 2014 10:13 AM
>>To: meta-ti@yoctoproject.org
>>Subject: [meta-ti] what branch of meta-ti should be used with
>>dora?
>>
>>I'm wondering what branch of meta-ti is a good one to use with OE
>>1.5/Dora.
>>
>>Thanks,
>>Cliff
>>
>>--
>>=================
>>http://bec-systems.com
>>--
>>_______________________________________________
>>meta-ti mailing list
>>meta-ti@yoctoproject.org
>>https://lists.yoctoproject.org/listinfo/meta-ti



-- 
=================
http://bec-systems.com

