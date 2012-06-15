Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BD31E013EB
	for <meta-ti@yoctoproject.org>; Thu, 14 Jun 2012 23:58:56 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so2711723bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 14 Jun 2012 23:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=uBRZ0nvo97m/gVzZ+jdp4G8AazEiuiOdjVn9UEpDCzU=;
	b=KDjDEuTizOM6J07j9yTGyQnsb/t1GO5I/NgPueeJ94td8x6pMvjMoE9Z3D1NPmgEUP
	uurfEDCnoeAILpCnklMgDA6KDXQOcTqGztpsN0uvJnW4KC0gouJHJ7TTLLQ9yTyVW19p
	mPMYTAhdCGuT6i7/RwJ8bs9izBabstDUGrKQgbjSMRGzonlXajEjhdHl364yZivJyAB9
	2pO04NoexmsUyZi4kdtMIZYRcjcllrJBGs+xYXjtaoRq7XJJQ1lwzB/cuUm3KY0ZU0SR
	zk3iQVBj3i0ZI+TSMuAFYv2yjSPUbLoCTCBF+WAmRXnrA/tpvWm/g25P3QUzssfpd6Eh
	ascw==
Received: by 10.205.133.6 with SMTP id hw6mr2228658bkc.93.1339743535090;
	Thu, 14 Jun 2012 23:58:55 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id ig1sm8969372bkc.4.2012.06.14.23.58.52
	(version=SSLv3 cipher=OTHER); Thu, 14 Jun 2012 23:58:53 -0700 (PDT)
Message-ID: <4FDADD2B.7060508@dresearch-fe.de>
Date: Fri, 15 Jun 2012 08:58:51 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20120612011706.GD30300@denix.org>
	<CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
In-Reply-To: <CA+2YH7sCF75itqV6o-Oc-LeUnS5LwA67HpL1F-w9jgL_GMCDzw@mail.gmail.com>
X-Enigmail-Version: 1.4.2
X-Gm-Message-State: ALoCoQk0mWKyLYNQobzhyLeyoYy90X615JKeq7raKv8yNUEAstoOJCY+ycdtWm4ZMCGdZJZU/ofJ
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Fri, 15 Jun 2012 06:58:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2012 16:15, Enrico wrote:
> On Tue, Jun 12, 2012 at 3:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> ....
>> with the possibility of moving them back to "main" meta-ti in the
>> future, once they become "first-class citizens", i.e. gain current and
>> continuing support.
> 
> What's the official TI plan for this? I mean:
> 
> - what platforms is TI going to support? what platforms is TI going to
> keep current?
> 
> - are there any plans to keep support for the dsp-related things?
> 
> I imported and fixed the dsp-related things from oe-classic, and Koen
> was the only one that helped me.
> 
> I posted some patches for gst-ducati for omap4, with help from Koen
> and Rob Clark, and nobody cared.
> 
> I know the concept of "opensource" and "community" but  it seems to me
> that TI has no interest in all of this, just look at the current
> platform support after the extras split.
> 
> The point is that you will not stop people complaining (like Steffen
> some days ago) just saying: "oh it's in extras you are lucky if it
> builds".
> 
> So the question is: are there any plans in TI to properly support its
> platforms or will this continue to be a place where to drop some code,
> forget about it and then move it to an extra layer?

It's really a great pity that there is no (official) response from TI to this . :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

