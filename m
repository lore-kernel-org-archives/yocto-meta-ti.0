Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5EFDE0079B; Wed,  3 Sep 2014 22:40:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11FA4E004A0
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 22:40:05 -0700 (PDT)
Received: by mail-ig0-f175.google.com with SMTP id uq10so497547igb.14
	for <meta-ti@yoctoproject.org>; Wed, 03 Sep 2014 22:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w7tYZKaBv+PEHAHdrTXc2wiaPeulGNFbs8RSotlszJM=;
	b=U4FZXwKcQPYnWWXt9OKo6NA2YjVh1Bv1CmG5xm8UMCIUdEHcNyWq+BSEO1G3RT4qLD
	j1bggEhQFakPQl1SlXGk0j6siQA6ve2f0lCz2t9vO3/oYDfDCMORJordbwtazGlY9NV7
	avuQnmITrhUhCXSHy3woECRKFAIV0/89wwKpgZOqo4kp6gexXGewi0nowj/1mD8NeJWr
	qiGXfTx5E5vKKPJfOIU4HEi+Zjdkim47B2wj3S05+15j94bII6HmRb+pfhm0GPTnYc1W
	iCt8B3uejuCZ9c81IItbOKjhZ6zNrvP5cbxdqXEOZ8HnimnhLA/9Vz7W0Ons32o9Pkjk
	RpgQ==
X-Received: by 10.42.62.6 with SMTP id w6mr2478596ich.24.1409809204665; Wed,
	03 Sep 2014 22:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 3 Sep 2014 22:39:34 -0700 (PDT)
In-Reply-To: <5407C780.5040801@pabigot.com>
References: <5407C780.5040801@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2014 22:39:34 -0700
Message-ID: <CAMKF1srA8gnfNF+myYTSm+VHjBeGCWwAC22y2OmrKYnkJffuQg@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 05:40:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 3, 2014 at 6:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> debian@beaglebone:~$ g++ -Ofast -mfloat-abi=hard -o card card.cpp
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


you should enable hardfloat ABI for poky as well for this kind of load.

