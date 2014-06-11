Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D580E00B83; Wed, 11 Jun 2014 01:13:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.128.181 listed in list.dnswl.org]
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBE9FE0082A
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 01:13:42 -0700 (PDT)
Received: by mail-ve0-f181.google.com with SMTP id db11so4646460veb.26
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KLv8jgnXVHcdIAy0k9qAHUSf+KBrpusIQMz8sAFTVBY=;
	b=Bn3rBFMbAMsbA+xQVz0Q9MSIgHVgQ8sxbTXLe28sZWWQL34c01oyjbRotcItBycd9S
	lJEAMKx9ySSv9wR2W8+CJu1DX0bQljOnNORiZyUuR98kgcfbfTPDUY3NrcuqIiJXtwrG
	x2jJQ+Oyil/2eDh0G/jzjIOssfdLfOlGczUKsKEoso9hXIwpIHBbtZQtkSs9b//tzEAk
	okAg6wCY5WEP8h2kFYFJmFBRf9mv5PTfFNp8or6nrVuE6FIZxbHWk9++vAeKoKEw11/T
	Gt6NejEjrUTwcQ6lqlJzLw1LbJWtEywThgIo2jNf6nqQL+EsKYXSxdWSzmP5XqYxeOAT
	90jw==
X-Received: by 10.58.132.70 with SMTP id os6mr1615702veb.36.1402474422017;
	Wed, 11 Jun 2014 01:13:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.198.163 with HTTP; Wed, 11 Jun 2014 01:13:11 -0700 (PDT)
In-Reply-To: <20140611025637.GK18034@edge>
References: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
	<20140611025637.GK18034@edge>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 11 Jun 2014 01:13:11 -0700
Message-ID: <CAK8F28khwqPSrfonrhqWDDe=_=Mn1602z8w-h3EYV9x_3oU4-g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: DSP packages for OMAP3
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
X-List-Received-Date: Wed, 11 Jun 2014 08:13:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 10, 2014 at 7:56 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Unfortunately, DSP support in meta-ti is not maintained currently, as
> explained in the corresponding README file.
Thanks Denys---I understand the recipes are aging a bit.  I mostly
trying to  get a handle on what is achievable with the current
state-of-the-art.  Know of any reason a) not to try with a recent
version of the CGT b) that hard float can't be used with DSP support
code?

--Ash

