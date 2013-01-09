Return-Path: <Andrei.Gherzan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E8A7E0147F
	for <meta-ti@yoctoproject.org>; Wed,  9 Jan 2013 05:53:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r09DrjCW025547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2013 05:53:45 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.244]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0318.004;
	Wed, 9 Jan 2013 05:53:44 -0800
From: "Gherzan, Andrei" <Andrei.Gherzan@windriver.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, meta-ti mailing list
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] any ETA for upgrading to mesa-dri_8.0.5?
Thread-Index: AQHN7m30LzoUkrCQO02YZ0FWNNN6hJhBBHBo
Date: Wed, 9 Jan 2013 13:53:43 +0000
Message-ID: <8A4F3EB72242474193467105FE6196292847D9BF@ALA-MBA.corp.ad.wrs.com>
References: <alpine.DEB.2.02.1301090646010.1391@oneiric>
In-Reply-To: <alpine.DEB.2.02.1301090646010.1391@oneiric>
Accept-Language: en-US, ro-RO
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.171.180]
MIME-Version: 1.0
Subject: Re: any ETA for upgrading to mesa-dri_8.0.5?
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
X-List-Received-Date: Wed, 09 Jan 2013 13:53:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. The maintainer is in vacation. I needed that patch too. But we will ha=
ve it soon. Keep it in your local copy for now.

ag
________________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Robert P. J. Day [rpjday@crashcourse.ca]
Sent: Wednesday, January 09, 2013 1:47 PM
To: meta-ti mailing list
Subject: [meta-ti] any ETA for upgrading to mesa-dri_8.0.5?

  currently, meta-ti still has a mesa-dri_8.0.4.bbappend file, while
OE core upgraded to version 8.0.5 just over a month ago.  is there any
reason meta-ti doesn't upgrade to 8.0.5 as well?

rday

--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

