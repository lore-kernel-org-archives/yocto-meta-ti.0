Return-Path: <jon.szymaniak+gpg@gmail.com>
Received: from mail-gh0-f181.google.com (mail-gh0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CBD8E00304
	for <meta-ti@yoctoproject.org>; Sat,  4 May 2013 12:36:38 -0700 (PDT)
Received: by mail-gh0-f181.google.com with SMTP id z12so478644ghb.26
	for <meta-ti@yoctoproject.org>; Sat, 04 May 2013 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=7OL+PRHfYhSJEwkOx9biBNx/6aCEQTV5k5o6lqZ1T00=;
	b=H3lF6xNkLhXZ+2wgfAVQjeFb+bAMnAeh5yYkjl2L6yiZBVe0da9JejYixC0WQtrTHG
	bpDVsNQHqf3/aCpMgd/+kwyW+pJT7i2nxdYGdxhXoUwt7uwMhHWl7pnDEGky2NTpqEAS
	f7AQ57AXij+5jVvLdNwKDhJnJiUmvP5Z/XXPyQX+TpMsbiTBzIYoGzsLaz8crsMHko0v
	xAPoQW4rmOIorDfwY9AyY0cBPn0p376j83aaDeSKCfPldLrX8CVDvm06zLfGBQFm98rX
	s6laFRamtdGa8eeIzbWQqrXN5TxCBIvPXLQSCt6IvsVa9v80A3Qd9Dl8IxbxVanUc8zB
	5DYA==
X-Received: by 10.236.126.179 with SMTP id b39mr13559351yhi.94.1367696197654; 
	Sat, 04 May 2013 12:36:37 -0700 (PDT)
Received: from [192.168.2.100] (cpe-24-93-28-150.rochester.res.rr.com.
	[24.93.28.150])
	by mx.google.com with ESMTPSA id q47sm9757058yhb.5.2013.05.04.12.36.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 12:36:35 -0700 (PDT)
Sender: Jon Szymaniak <jon.szymaniak@gmail.com>
Message-ID: <51856341.9050809@gmail.com>
Date: Sat, 04 May 2013 15:36:33 -0400
From: Jon Szymaniak <jon.szymaniak+gpg@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Allen, Scott (ITS)" <sallen@ti.com>
References: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
	<20130428201051.GB11072@edge>
	<CANge7vXrkgrcOyn8Sn2wC5qXLOw2FwzVqW9QfOjs-tBLuirkxw@mail.gmail.com>
	<31331E6D91818F49B78B9920E96E64C704A3B444@DFLE08.ent.ti.com>
	<20130502192802.GC2364@edge>
In-Reply-To: <20130502192802.GC2364@edge>
X-Enigmail-Version: 1.5.1
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: linux-ti-staging fetcher failures
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
X-List-Received-Date: Sat, 04 May 2013 19:36:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> Thanks, Scott!
> 
> On Thu, May 02, 2013 at 02:45:09PM -0400, Allen, Scott (ITS)
> wrote:
>> All, network team has identified a routing issue and made some
>> corrections. Initial testing indicates this resolved the
>> problem.
>> 
>> Please try/ test again and let me know if the problem continues.
>> 
>> -scott
>> 

All is well here -- thank you very much for looking into this! :)

- -- 
Jon Szymaniak <jon.szymaniak+gpg@gmail.com>

OpenPGP Key Hosted at the following keyservers:
http://keyserver.ubuntu.com/
http://pgp.mit.edu/

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRhWMcAAoJEAmo9+OlSWixwFQQAJ84ZilK39aT0qz53zGV7jNR
EwrdN+FeZSP1n2hFaveRxmuSDWvN/iiWaQvF3O1itbRJKAiS0oRPm0oSr4TyFORp
b9yOPPrpVhATNLI7bLdTHgrIlGmmXVevZ1dYiAdkLIptcksHZHrA9dGxezY4j1xy
I9HfnELfmgoOrmOipqNZ/odbnkq5jcwgxR0BMDQOF1zuVcku2/HusY83cuCiujyy
Usp7ySEL4NAB3o3ORHmsRhbgQ+usyJCXNmwa7a4ulTM8UKukFoJsYwfjy0DxDDGT
MyBUsTL2hYQJqI080Uuznw82ZpzSsXEg3kn8OyvLtHt0SpExNqftTL9harXuWAdL
qoXRDQIhfWbRJBTiASKXsMNY6DSRbaHNAtWRhpWxNHOS1oHd+QU3MI3kf6cgAX6C
45jpiDze1swVgLl9cA8mdRd5BPmQKm2dnJW4CyuRc0CQ91Fn5fFIPUegBKG0ds9R
D+/YpfyaaCw82wIbotUjKq+ZsiXDDG8zzyiClzROdhA4vkaUJKkM6mIJOBXcec4t
c709sgRnhmGjnzp9jslFFcV82VKQ/xuuPVrgAjneCG4NL+/4SQl4XF2ETJjdkna1
BnvsVN5h1w4ArJKolHCR/Y+zqT0doww2h5Bq+ohcrymcf9PBsVXMXBhUsTez/0a3
bCSwGxAexyphPL8YwCRH
=PwDD
-----END PGP SIGNATURE-----

