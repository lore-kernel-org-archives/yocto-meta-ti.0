Return-Path: <samuli.piippo@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A7EAE0087A
	for <meta-ti@yoctoproject.org>; Tue, 21 Jan 2014 00:23:30 -0800 (PST)
Received: by mail-ee0-f47.google.com with SMTP id d49so3126039eek.34
	for <meta-ti@yoctoproject.org>; Tue, 21 Jan 2014 00:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tzOwZowdCKhB26pRg8sY+AzHfgRDrzVsB2TFSBG5tO4=;
	b=HKgnFJ5mRW2R1sMLuMzSw98NDFiuOPZsUtiwRufSb+QgTSh9I19vRK4qbwemU6jpzZ
	JFSVz6RPvY9u1oTiYA8ZB5tZ+7JJuxQFNr7pb7/sx4WqXuwXN34+Z2dP5l6v8395dGDo
	v6zybZ2aV32tLG31pPCQh1S+mu8qiMjhWdAKRB1dBSSKtZIsgmxYY2mcLAkQ09CVMzkx
	rT3djsMYl/AnJNmpqLRMReIyiRKI5tHRB7y8wyXjdLmOEEcG1W8MAoMK5lslP4ZxzaWL
	OE3mQi0hx2tnqv46Np8DD4DQ5mwPwMu/9MoBO/xuKUZf4mqNQJC/niqmhHi5qq4Qjzg6
	eaqA==
X-Received: by 10.14.177.200 with SMTP id d48mr22362192eem.8.1390292609330;
	Tue, 21 Jan 2014 00:23:29 -0800 (PST)
Received: from [10.9.5.71] ([91.217.248.11]) by mx.google.com with ESMTPSA id
	z49sm12015020eeo.10.2014.01.21.00.23.28 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 00:23:28 -0800 (PST)
Message-ID: <52DE2E7F.5080705@gmail.com>
Date: Tue, 21 Jan 2014 10:23:27 +0200
From: Samuli Piippo <samuli.piippo@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <52D936DC.2090806@gmail.com> <20140120145529.GX12727@edge>
In-Reply-To: <20140120145529.GX12727@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: usb problems with BeagleBone Black
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
X-List-Received-Date: Tue, 21 Jan 2014 08:23:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20.01.2014 16:55, Denys Dmytriyenko wrote:
> On Fri, Jan 17, 2014 at 03:57:48PM +0200, Samuli Piippo wrote:
>> Hi,
>>
>> I've been trying to get BeagleBone Black to work with poky image, but
>> there seems to be some issues with USB.
>> No usb devices are detected by kernel and e.g., 'lsusb' return error
>> 'unable to initialize libusb: -99'
>>
>> Anyone know if USB is supposed to work on BBB with current meta-ti layer?
>>
>> I'm using yocto from dora branch and meta-ti from master.
> 
> Samuli,
> 
> There are reports that when meta-ti kernel is built with Poky, something is 
> missing and USB doesn't get initialized. When built with Arago, everything 
> works as expected. I haven't had a chance to look into it yet, but I'll try to 
> figure out the difference once I have time. You might want to check the Arago 
> build in the meantime.
> 

Thanks for info and any help on resolving this is greatly appreciated.
In the mean time, I will look at the arago build.

-samuli

