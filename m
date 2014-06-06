Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE74AE00BF0; Fri,  6 Jun 2014 08:13:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cliff.brake[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.46 listed in list.dnswl.org]
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5225BE00B9F
	for <meta-ti@yoctoproject.org>; Fri,  6 Jun 2014 08:13:06 -0700 (PDT)
Received: by mail-qa0-f46.google.com with SMTP id w8so3991709qac.33
	for <meta-ti@yoctoproject.org>; Fri, 06 Jun 2014 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1YhtNdoPnePKzAaXtlVQn2Up3eiuVAHMNUxyRTC1uJ4=;
	b=F//dtceMoPV+KW0rRDNsmoFTJXtY+O6Jw9NETO5EvbG2EyCyZC2n+Yse5vbcdtLLme
	HYyfmHxDRItvIA3SWETHR/eLyn1uKRZ/0udlJjD8lzZY0z96zxMLV7jd67TiAAoTYwt6
	gnp4PfqEUFlhwyDxP/qvum+jIqGSKSiNYQI8Sv3NJ/tcyoa52NIwdl9bL/nGHsgVPuE1
	Wl/2MHguMybfwJeyI4nK2R4P0UCb2Pb5XfmFnTqGuaeRqn4UL2QRVy4gDU5cGa14gAbs
	n3+TKtTk/B15D96jcHII2itvQdSqmCkoIWDhIO7DRDFWji7G1yIGWgKlzccoizxeB1TQ
	52zA==
MIME-Version: 1.0
X-Received: by 10.140.82.113 with SMTP id g104mr9209003qgd.55.1402067585414;
	Fri, 06 Jun 2014 08:13:05 -0700 (PDT)
Received: by 10.140.31.73 with HTTP; Fri, 6 Jun 2014 08:13:05 -0700 (PDT)
Date: Fri, 6 Jun 2014 11:13:05 -0400
Message-ID: <CAOd_LFzCrgUGLKtgPUSQgxtd7ASn8Ee4oBbDyCSZH8yobh78pw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: what branch of meta-ti should be used with dora?
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
X-List-Received-Date: Fri, 06 Jun 2014 15:13:08 -0000
Content-Type: text/plain; charset=UTF-8

I'm wondering what branch of meta-ti is a good one to use with OE 1.5/Dora.

Thanks,
Cliff

-- 
=================
http://bec-systems.com

